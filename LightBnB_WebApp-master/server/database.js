const pool = require('./index.js')

/// Users

/**
 * Get a single user from the database given their email.
 * @param {String} email The email of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithEmail = function(email) {
  return pool.query(`
  SELECT *
  FROM users
  WHERE email = $1;
  `, [email])
  .then(res => res.rows[0])
}
exports.getUserWithEmail = getUserWithEmail;

/**
 * Get a single user from the database given their id.
 * @param {string} id The id of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithId = function(id) {
  return pool.query(`
  SELECT *
  FROM users
  WHERE id = $1;
  `, [id])
  .then(res => res.rows[0])
}
exports.getUserWithId = getUserWithId;


/**
 * Add a new user to the database.
 * @param {{name: string, password: string, email: string}} user
 * @return {Promise<{}>} A promise to the user.
 */
const addUser =  function(user) {
  return pool.query(`
  INSERT INTO users (name, email, password)
  VALUES ($1, $2, $3)
  RETURNING *;
  `, [user.name, user.email, user.password])
  .then(res => res.rows[0]);

  // const userId = Object.keys(users).length + 1;
  // user.id = userId;
  // users[userId] = user;
  // return Promise.resolve(user);
}
exports.addUser = addUser;

/// Reservations

/**
 * Get all reservations for a single user.
 * @param {string} guest_id The id of the user.
 * @return {Promise<[{}]>} A promise to the reservations.
 */
const getAllReservations = function(guest_id, limit = 10) {
  const query = `
  SELECT properties.*, reservations.*, AVG(property_reviews.rating) AS average_rating
  FROM properties
  JOIN reservations ON reservations.property_id = properties.id
  JOIN property_reviews ON property_reviews.property_id = properties.id
  WHERE reservations.guest_id = $1
  GROUP BY properties.id, reservations.id 
  HAVING end_date < now()::date
  ORDER BY start_date DESC
  LIMIT $2;
  `;
  const values = [guest_id, limit];

  return pool.query(query, values)
  .then(res => res.rows)
}
exports.getAllReservations = getAllReservations;

/// Properties

/**
 * Get all properties.
 * @param {{}} options An object containing query options.
 * @param {*} limit The number of results to return.
 * @return {Promise<[{}]>}  A promise to the properties.
 */
const getAllProperties = function(options, limit = 10) {
  const queryParams = [limit];

  let queryString = `
  SELECT properties.* , AVG(property_reviews.rating) AS average_rating
  FROM properties
  JOIN property_reviews ON property_reviews.property_id = properties.id`
  

  if(options.city){
    queryParams.push (`%${options.city.toLowerCase()}%`);
    queryString += `\nWHERE LOWER(city) LIKE $${queryParams.length}`
  }

  if(options.owner_id){
    queryParams.push (`${options.owner_id}`);
    queryString.includes('WHERE') ?
    queryString += `\nAND owner_id = $${queryParams.length}` :
    queryString += `\nWHERE owner_id = $${queryParams.length}`
  }

  if(options.minimum_price_per_night){
    queryParams.push (`${options.minimum_price_per_night * 100}`);
    queryString.includes('WHERE') ?
    queryString += `\nAND cost_per_night >= $${queryParams.length}` :
    queryString += `\nWHERE cost_per_night >= $${queryParams.length}`
  }

  if(options.maximum_price_per_night){
    queryParams.push (`${options.maximum_price_per_night * 100}`);
    queryString.includes('WHERE') ?
    queryString += `\nAND cost_per_night <= $${queryParams.length}` :
    queryString += `\nWHERE cost_per_night <= $${queryParams.length}`
  }

  queryString += `
  GROUP BY properties.id`;

  if(options.minimum_rating){
    queryParams.push (`${options.minimum_rating}`);
    queryString += `\nHAVING AVG(property_reviews.rating) >= $${queryParams.length}`
  }

  queryString += `
  ORDER BY cost_per_night
  LIMIT $1;
  `;

  return pool.query(queryString, queryParams)
  .then(res => res.rows);
}
exports.getAllProperties = getAllProperties;


/**
 * Add a property to the database
 * @param {{}} property An object containing all of the property details.
 * @return {Promise<{}>} A promise to the property.
 */
const addProperty = function(property) {
  const queryParams = [
  property.owner_id,
  property.title,
  property.description,
  property.thumbnail_photo_url,
  property.cover_photo_url,
  property.cost_per_night,
  property.street,
  property.city,
  property.province,
  property.post_code,
  property.country,
  property.parking_spaces,
  property.number_of_bathrooms,
  property.number_of_bedrooms
  ]
  let queryString = 
 ` INSERT INTO properties 
(owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, street, city, province, post_code, country, parking_spaces, number_of_bathrooms, number_of_bedrooms )
VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14)
RETURNING *`

return pool.query(queryString, queryParams)
  .then(res => res.rows);
}
exports.addProperty = addProperty;

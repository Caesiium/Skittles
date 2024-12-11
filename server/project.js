const express = require('express');
const app = express();
const cors = require('cors');
require('dotenv').config();
const{ Pool } = require('pg');
app.use(cors());
const port = 8080;
app.use(express.json());

//postgres connection
const pool = new Pool({
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
})

pool.connect((err) => {
    if(err){
        console.error('Dase connection error', err.stack);
    } else{
        console.log('Database connected');
    }
});

//get supermarket id from given name
async function getSupermarketIDbyName(supermarketName) {
    try{
        const query = 'SELECT supermarket_id FROM supermarkets WHERE supermarket_name = $1'
        const name = [supermarketName];
        const result = await pool.query(query, name);
        if(result.rows.length == 0) {
            throw new Error('Supermarket not found');
        }
        const supermarket_id = result.rows[0].supermarket_id;
        console.log(`Supermarket id found: ${supermarket_id}`);
        return supermarket_id;
        
    } catch (error){
        console.error('Error fetching supermarket ID: ', error.message);
        throw error;
    }
}

//add supermarket to new order
app.post('/api/NewOrder', async (req, res) => {
    console.log('Request body: ', req.body);
    const { supermarket_name } = req.body;
    if(!supermarket_name){
        return res.status(400).json({ message: 'Supermarket name is required'});
    }
    try{
        const supermarketID = await getSupermarketIDbyName(supermarket_name);
        const result = await pool.query(
            'INSERT INTO orders (supermarket_id) VALUES ($1) RETURNING *',
            [supermarketID]
        );
        res.json(result.rows[0]);
    } catch (err) {
        console.error(err.message);
        res.status(500).send('Server error');
    }
})


//select all groceries
app.get('/api/ViewOrders', async (req,res) => {
    try{
        const result = await pool.query('SELECT * FROM groceries');
        res.json(result.rows);
    } catch{
        console.error(err.message);
        res.status(500).send('Server error');
    }
});

//add user
app.post('/api/user', async (req, res) => {
    try{
        const { user_name, user_email, user_password } = req.body;
        const result = await pool.query(
            'INSERT INTO users (user_name, user_email, user_password) VALUES ($1, $2, $3) RETURNING *',
            [user_name, user_email, user_password]
        );
        res.json(result.rows[0]);
    } catch (err) {
        console.error(err.message);
        res.status(500).send('Server error');
    }
});

//add new order - CHANGE API ENDPOINT ACCORDING TO FRONTEND PAGES
app.post('/api/NewOrder', async (req, res) => {
    try{
        const { supermarket_id } = req.body;
        const result = await pool.query(
            'INSERT INTO orders (supermarket_id) VALUES ($1) RETURNING *',
            [supermarket_id]
        );
        res.json(result.rows[0]);
    } catch (err) {
        console.error(err.message);
        res.status(500).send('Server error');
    }
});

//add users to order

app.post('/api/NewOrder', async (req, res) => {
    try{
        const { order_id, user_id } = req.body;
        const result = await pool.query(
            'INSERT INTO users_in_orders (order_id, user_id) VALUES ($1, $2) RETURNING *',
            [order_id, user_id]
        );
        res.json(result.rows[0]);
    } catch (err) {
        console.error(err.message);
        res.status(500).send('Server error');
    }
});

//add items to order

app.post('/api/NewOrder', async (req, res) => {
    try{
        const { order_id, user_id } = req.body;
        const result = await pool.query(
            'INSERT INTO users_in_orders (order_id, user_id) VALUES ($1, $2) RETURNING *',
            [order_id, user_id]
        );
        res.json(result.rows[0]);
    } catch (err) {
        console.error(err.message);
        res.status(500).send('Server error');
    }
});


const ViewOrdersData = [
  { title: 'View Orders'}
];

const NewOrderData = [
  { title: 'New Order'}
];

app.get('/api/ViewOrders', (req, res) =>{
  res.json(ViewOrdersData);
});

app.get('/api/NewOrder', (req, res) =>{
  res.json(NewOrderData);
});

// Start server
app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});
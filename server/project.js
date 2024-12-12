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


//get all user info out of the table
app.post('/api/validate', async (req, res) => {
    const { userEmail, userPassword } = req.body;
    try{
        const query = 'SELECT user_password, user_name FROM users WHERE user_email = $1';
        const result = await pool.query(query, [userEmail]);
        if(result.rows.length === 0 || !result.rows[0].user_password){
            return res.json({ message: 'Invalid email or password' });
        }
        else if(userPassword !== result.rows[0].user_password){
            return res.json({ message: 'Invalid email or password'});
        }
        else{
            const userName = result.rows[0].user_name;
            console.log('nanananame', userName);
            return res.json({ message: 'Successful login', userName });
        }

    } catch (err){
        console.error('Error validating', err.message);
        return res.status(500).send('Server error');
    }
});

//get supermarket id from given name
async function getSupermarketIDbyName(supermarketName) {
    try{
        if(!supermarketName){
            throw new Error('Supermarket name not defined');
        }
        const query = 'SELECT supermarket_id FROM supermarkets WHERE supermarket_name = $1'
        const name = [supermarketName];
        const result = await pool.query(query, name);
        if(result.rows.length == 0) {
            throw new Error('Supermarket not found');
        }
        const supermarket_id = Number(result.rows[0].supermarket_id);
        return supermarket_id;
        
    } catch (error){
        console.error('Error fetching supermarket ID: ', error.message);
        throw error;
    }
};

async function getGroceryData(selectedItems){
    try{
        console.log('recieved', selectedItems);
        if(!selectedItems || selectedItems.length === 0){
            throw new Error('No grocery data found');
        }
        const query = 'SELECT * FROM groceries WHERE grocery_id = ANY($1)'
        const result = await pool.query(query, [selectedItems]);
        if(result.rows.length == 0){
            throw new Error('No grocery data found');
        }
        console.log('????', result.rows);
        
        return result.rows;

    } catch (err) {
        console.error('Error fetching grocery data', err);
        throw err;
    }
}; 

//add supermarket to new order
app.post('/api/NewOrder', async (req, res) => {
    const { supermarket_name } = req.body;
    console.log('pls here i beg', supermarket_name);
    if(!supermarket_name){
        return res.status(400).json({ message: 'Supermarket name is required'});
    }
    try{
        const supermarketID = await getSupermarketIDbyName(supermarket_name);
        const result = await pool.query(
            'INSERT INTO orders (supermarket_id) VALUES ($1) RETURNING *',
            [supermarketID]
        );
        res.json(result.rows[0].order_id);
    } catch (err) {
        console.error('Error here???', err.message);
        res.status(500).send('Server error');
    }
});

//insert all groceries into the items_in_order page
// app.post('api/EditOrder', async (req, res) => {
    
// })

//select all groceries for the viewer to select from
app.get('/api/ShopItems', async (req,res) => {
    try{
        const { supermarketName }  = req.query;
        console.log('yipeeee', supermarketName);
        const superId = await getSupermarketIDbyName(supermarketName);
        console.log('id ', superId);
        const result = await pool.query('SELECT * FROM groceries WHERE supermarket_id = $1', 
            [superId],
        );
        res.json(result.rows);
    } catch (err) {
        console.error('Error here??????', err.message);
        res.status(500).send('Server error');
    }
});

//send grocery information
app.post('/api/EditOrder', async (req, res) => {
    try{
        console.log('request body', req.body);
        const { selectedItems } = req.body;
        if(!selectedItems || selectedItems.length === 0){
            throw new Error('No grocery data found');
        }
        console.log('here too', selectedItems);
        const groceryIds = selectedItems.map(item => item.grocery_id);
        console.log('extafsbfs ids', groceryIds);
        const result = await getGroceryData(groceryIds);
        res.json(result);
    }catch (err) {
        console.error('Error here yes', err.message);
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
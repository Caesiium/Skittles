import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Link, useNavigate, useLocation } from 'react-router-dom';
function ShopItems({ selectedItems, setSelectedItems }){

    const [grocery, setGrocery] = useState([]);
    const [loading, setLoading] = useState(true);
    const [groceryError, setGroceryError] = useState('');
    //const [selectedItems, setSelctedItems] = useState([]);
    const navigate = useNavigate();
    const location = useLocation();

    useEffect(() => {
        const getGroceries = async () => {
            try{
                const response = await axios.get('http://localhost:8080/api/ShopItems');
                console.log('Fetched: ', response.data);
                setGrocery(response.data);
                setLoading(false);
            } catch (err) {
                setGroceryError(err);
                setLoading(false);
            }
        };
        getGroceries();
    }, []);

    if(loading){
        return <div>Loading...</div>;
    }
    if(groceryError){
        return <div>Error: {groceryError.message}</div>;
    }

    const handleInputChanged = (grocery_id, quantity) => {
        setSelectedItems((prevSelectedItems) => {
           const updatedItems = [...prevSelectedItems];
           const index = updatedItems.findIndex((grocery) => grocery.grocery_id === grocery_id);
           if (index === -1){
                return [...prevSelectedItems, { grocery_id, quantity: Number(quantity) }];
                //updatedItems.push({ grocery_id, quantity: Number(quantity) });
           } else {
                const updatedItems = [...prevSelectedItems];
                updatedItems[index].quantity = Number(quantity)
                //updatedItems[index] = { grocery_id, quantity: Number(quantity) };
           }
           return updatedItems;
        });
    };

    const handleSubmit = async(e) => {
        e.preventDefault();
        navigate('/EditOrder', { state: { selectedItems } });
    }

    return (
        <div>
            <h1>Select Items</h1>
            <form onSubmit={handleSubmit}>
                {grocery.map((groceries) => (
                    <div key={groceries.grocery_id}>
                        <input
                            type="number"
                            min="0"
                            value={selectedItems.find(grocery => grocery.grocery_id === groceries.grocery_id)?.quantity || 0}
                            onChange={(e) => handleInputChanged(groceries.grocery_id, e.target.value)}
                        />
                        <label>{groceries.grocery_name}</label>
                    </div>
                ))}
                <button type="submit">Select Items</button>
            </form>
        </div>
    );


}

export default ShopItems;

import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Link } from 'react-router-dom';
function NewOrder(){
    // const [data, setData] = useState(null);
    // const [loading, setLoading] = useState(true);
    // const [error, setError] = useState(null);

    // useEffect(() => {
    //     const fetchData = async() => {
    //         try {
    //             const response = await axios.get('http://localhost:8080/api/NewOrder')
    //             setData(response.data);
    //             setLoading(false);
    //         } catch (err){
    //             setError(err.message);
    //             setLoading(false);
    //         }
    //     };
    //     fetchData();
    // }, []);

    // if(loading){
    //     return <div>Loading...</div>;
    // }

    // if(error){
    //     return <div>Error: {error}</div>
    // }

    return(
            <div>
           <ul>
           {/* {data && Array.isArray(data) && data.map((post, index) => (
                <li key={post.title}>{post.title}</li>
            ))} */}
           </ul>
           <form className='newOrder'>
            <label>
                Supermarket
                <select className='superMarket'>
                    <option value="NoOp">Please Choose a Shop</option>
                    <option value = "Sainsburys">Sainsburys</option>
                    <option value="Lidl">Lidl</option>
                    <option value="Tesco">Tesco</option>
                    <option value="Aldi">Aldi</option>
                </select>
            </label>
            <br/>
            <button><Link to="/EditOrder">Start Order</Link></button>
           </form>
        </div>
        
        
    );
}

export default NewOrder;
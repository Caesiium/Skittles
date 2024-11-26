import React, { useState, useEffect } from 'react';
import axios from 'axios';
function NewOrder(){
    const [data, setData] = useState(null);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    useEffect(() => {
        const fetchData = async() => {
            try {
                const response = await axios.get('http://localhost:8080/api/NewOrder')
                setData(response.data);
                setLoading(false);
            } catch (err){
                setError(err.message);
                setLoading(false);
            }
        };
        fetchData();
    }, []);

    if(loading){
        return <div>Loading...</div>;
    }

    if(error){
        return <div>Error: {error}</div>
    }

    return(
        <div>
           <ul>
           {data && Array.isArray(data) && data.map((post, index) => (
                <li key={post.title}>{post.title}</li>
            ))}
           </ul>
        </div>
    );
}

export default NewOrder;

import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Link } from 'react-router-dom';
function ShopItems(){
    const [item, setItem] = useState('')
    const [itemError, setItemError] = useState('')

    const onButtonCLick = () => {
        setItemError('')

        if('' === item){
          setItemError('Please enter an item')
          return
        }

        //enter validation for if item not in stock/not in db

    }

    return(
        <div className='mainBody'>
            <div className='title'>
                Items
            </div>
            <br />
            <input
            value={item}
            placeholder="Search for items"
            onChange={(ev) => setItem(ev.target.value)}
            className={'inputBox'}
            />
            <div className={'inputContainer'}>
            <input className={'inputButton'}
                type = "button"
                onClick={onButtonCLick}
                value={'Enter'}
            />
        </div>
            <label className="errorLabel">{itemError}</label>
        </div>
    );
}

export default ShopItems;
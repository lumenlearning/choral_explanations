"use strict";
import React from 'react';
import {Router, Route, IndexRoute, browserHistory} from 'react-router';

//IMPORT COMPONENTS HERE



export default ()=>{
  return (
    <Router history={browserHistory}>
      <Route path="/" component={Base} >

      </Route>
    </Router>
  )
}
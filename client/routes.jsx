"use strict";
import React from 'react';
import {Router, Route, IndexRoute, browserHistory} from 'react-router';

//IMPORT COMPONENTS HERE
import ChorusIndex from './components/chorus/index.jsx';
import Chorus from './components/chorus/chorus.jsx';

export default ()=>{
  return (
    <Router history={browserHistory}>
      <Route path="/" component={ChorusIndex} />
      <Route path="/choruses/:chorusId" component={Chorus} />
    </Router>
  )
}
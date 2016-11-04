import alt      from '../alt.jsx';
import request  from '../scripts/request.js';

const Request = new request();

class ResponseActions {

  loadAll(options) {
    const route = "choruses/" + options.chorusId + "/responses?";

    return (dispatch) => {
      Request.get(route, {}, (err, res)=> {
        dispatch({chorusId: options.chorusId, response: res});
      });
    }

  }


  createResponse(params, responseProperties, callback=null){
    const route = "choruses/" + params.chorusId + "/responses";

    return (dispatch) => {
      Request.post(route, {response: responseProperties}, (err, res)=> {
        dispatch({chorusId: params.chorusId, response: res.data});
        if(callback){
          callback(res.data);
        }
      });
    }
  }


}

export default alt.createActions(ResponseActions);

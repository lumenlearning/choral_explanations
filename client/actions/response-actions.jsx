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


}

export default alt.createActions(ResponseActions);

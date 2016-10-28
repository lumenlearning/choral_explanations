import alt      from '../alt.jsx';
import request  from '../scripts/request.js';

const Request = new request();

class ChorusActions {

  load(options) {
    const route = "choruses/" + options.chorusId + "?";

    return (dispatch) => {
      Request.get(route, {}, (err, res)=> {
        dispatch(res);
      });
    }
  }

  loadAll() {
    const route = "choruses/";

    return (dispatch) => {
      Request.get(route, {}, (err, res)=> {
        dispatch(res);
      });
    }

  }


}

export default alt.createActions(ChorusActions);

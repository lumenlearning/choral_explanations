import alt from '../alt.jsx'
import _ from 'lodash'
import ResponseActions from '../actions/response-actions.jsx'

class ResponseStore {

  constructor() {
    this.bindActions(ResponseActions);

    this.state = {
    }
  }

  onLoadAll(data) {
    this.setState({
      [data.chorusId] : data.response.data
    });
  }

}

export default alt.createStore(ResponseStore);

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

  onCreateResponse(data) {
    let responses = _.clone(this.state[data.chorusId], true);
    responses.push(data.response);

    this.setState({
      [data.chorusId]: responses
    });
  }

}

export default alt.createStore(ResponseStore);

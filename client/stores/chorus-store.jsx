import alt from '../alt.jsx'
import _ from 'lodash'
import ChorusActions from '../actions/chorus-actions.jsx'

class ChorusStore {

  constructor() {
    this.bindActions(ChorusActions);

    this.state = {
      choruses: []
    }
  }

  onLoad(data) {
    this.setState({
      [data.data.id] : data.data
    });
  }

  onLoadAll(data) {
    this.setState({
      choruses : data.data
    });
  }

}

export default alt.createStore(ChorusStore);

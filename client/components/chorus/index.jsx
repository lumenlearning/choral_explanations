import React, {Component} from 'react';
import ChorusActions from '../../actions/chorus-actions.jsx'
import ChorusStore from '../../stores/chorus-store.jsx'
import {Link} from 'react-router'

export default class ChorusIndex extends Component{
  constructor(props){
    super(props);
    this.state = {
      choruses: []
    };

    this.onChange = this.onChange.bind(this);
  }

  componentDidMount() {
    ChorusStore.listen(this.onChange);
    ChorusActions.loadAll();
  }

  componentWillUnmount() {
    ChorusStore.unlisten(this.onChange);
  }

  onChange(state) {
    this.setState({choruses: state.choruses});
  }

  render() {
    return (
      <ul>
        {this.state.choruses.map((chorus) => {
          return (
            <li key={chorus.id}><Link to={`/choruses/${chorus.id}`}>{chorus.attributes.name}</Link></li>
          );
        })}
      </ul>
    );
  }
}

import React, {Component} from 'react';
import ResponseActions from '../../actions/response-actions.jsx';
import ResponseStore from '../../stores/response-store.jsx';
import Response from './response.jsx';
import IframeHelper from '../../scripts/iframeHelper.js';
import Style from 'style';

export default class Responses extends Component{
  constructor(props){
    super(props);
    this.state = {responses: null};

    this.onChange = this.onChange.bind(this);
  }

  componentDidMount() {
    ResponseStore.listen(this.onChange);
    ResponseActions.loadAll({chorusId: this.props.chorusId});
  }

  componentWillUnmount() {
    ResponseStore.unlisten(this.onChange);
  }

  onChange(state) {
    this.setState({responses: state[this.props.chorusId]});
    setTimeout(()=>{IframeHelper.setHeight(900)}, 150)
  }

  render() {
    let font = Style.font();

    if( !this.state.responses ){
      return <p>Loading...</p>
    }

    return (
      <div className={Style.css(font.normal)}>
        <ul>
        {this.state.responses.map((res) => {
          return (
            <li key={res.id}>
              <a href={"#res_" + res.id}>{res.attributes.name}</a>
            </li>
          );
        })}
        </ul>
        {this.state.responses.map((res) => {
          return (
            <Response key={res.id} response={res} />
          );
        })}
      </div>
    );
  }
}

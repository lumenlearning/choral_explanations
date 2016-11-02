import Theme from 'theme'

export default new class Style extends Theme {
  constructor() {
    super()

    let colors = this.colors()
    let screen = this.screenSize()

    this.style = this.create({
      'chorusH1': {
        fontSize: '1.85em'
      },
      'chorusH2': {
        fontSize: '1.3em'
      },
      'chorusH2': {
        fontSize: '1.1em'
      },
      'chorusH3': {
        marginTop: '50px'
      },
      'chorusP': {
        fontSize: '0.9em'
      },
      'showResponses': {
        height: '50px',
        width: '200px',
        color: '#FFF',
        fontSize: '0.9em',
        margin: '1.5em',
        cursor: 'pointer',
        border: '2px solid #044c66',
        borderRadius: '7px',
        backgroundColor: '#077FAB',
        fontWeight: 'bold'
      },
      'hr': {
        margin: '1.5em 0'
      },
      'userPreviewWrapper': {
        display: 'flex',
        flexDirection: 'row',
        alignItems: 'center'
      },
      'avatarImg': {
        height: '50px',
        borderRadius: '25px'
      },
      'userInfo': {
        marginLeft: '10px',
        fontSize: '0.8em',
        lineHeight: '1.3em'
      }
    })
  }

  styles() {
    return this.style
  }
}

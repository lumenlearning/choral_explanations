import Theme from 'theme'

export default new class Style extends Theme {
  constructor() {
    super()

    let colors = this.colors()
    let screen = this.screenSize()

    this.style = this.create({
      red: {
        color: 'red'
      }
    })
  }

  styles() {
    return this.style
  }
}

import {StyleSheet, css} from 'aphrodite/no-important';

export default class Theme{
  constructor(){
    let gridType = this.constructor.gridType();
    let gridPos = this.constructor.gridPos();
    let gridItems = this.constructor.gridItems();

    this.themeStyles = StyleSheet.create({
      ...gridType,
      ...gridPos,
      ...gridItems
    });
  };

  theme(){
    return this.themeStyles;
  };

  screenSize(){
    return this.constructor.queries();
  };

  colors(){
    return this.constructor.color();
  };

  create(styles){
    return StyleSheet.create(styles);
  };

  css(){
    return css(...arguments);
  }

  font() {
    return StyleSheet.create(this.constructor.fonts());
  }

  static gridType(){
    return {
      'grid':{
        display: 'flex',
        flexDirection: 'row'
      },
      'gridReverse':{
        display: 'flex',
        flexDirection: 'row-reverse'
      },
      'gridColumn': {
        display: 'flex',
        flexDirection: 'column'
      },
      'gridColumnReverse':{
        display: 'flex',
        flexDirection: 'column-reverse'
      },
    }
  };

  static gridPos(){

    return {
      //Horizontal ROW Justification
      'gridLeft':{
        justifyContent: 'flex-start'
      },
      'gridCenter':{
        justifyContent: 'center'
      },
      'gridRight':{
        justifyContent: 'flex-end'
      },
      'gridSpaceBetween':{
        justifyContent: 'space-between'
      },
      'gridSpaceAround':{
        justifyContent: 'space-around'
      },

      //Vertical align items
      'gridAlignTop':{
        alignItems: 'flex-start',
      },
      'gridAlignBottom':{
        alignItems: 'flex-end'
      },
      'gridAlignCenter':{
        alignItems: 'center'
      },
      'gridAlignStretch':{
        alignItems: 'stretch'
      },
      'gridAlignBaseline': {
        alignItems: 'baseline'
      },

      //Horizontal Grid CONTENT Align
      'gridContentTop':{
        alignContent: 'flex-start',
      },
      'gridContentBottom':{
        alignContent: 'flex-end',
      },
      'gridContentCenter':{
        alignContent: 'center'
      },
      'gridContentStretch':{
        alignContent: 'stretch'
      },
      'gridContentSpaceBetween':{
        alignContent: 'space-between'
      },
      'gridContentSpaceAround': {
        alignContent: 'space-between'
      }
    }
  };

  static gridItems (){
    return {
      'gridItemAlignTop': {
        alignSelf: 'flex-start'
      },
      'gridItemAlignBottom': {
        alignSelf: 'flex-end'
      },
      'gridItemCenter':{
        alignSelf: 'center'
      },
      'gridItemStretch':{
        alignSelf: 'stretch'
      },
      'gridItemBaseline':{
        alignSelf: 'baseline'
      }
    }
  };

  static queries (){
    return {
      xs: '@media (min-width: 480px)',
      sm: '@media (min-width: 640px)',
      md: '@media (min-width: 1024px)',
      lg: '@media (min-width: 1440px)',
      xl: '@media (min-width: 1920px)'
    }
  };

  static fonts() {
    return {
      normal: {fontFamily:'sans-serif'},
      italic: {fontFamily:'sans-serif', fontStyle:'italic'},
      bold: {fontFamily:'sans-serif', fontWeight:'bold'}
    }
  }

  static color () {
    return {
      bg: {
        primary: '#19647E', //blueish (found in study_plan header)
        secondary: '#FFFFFF',
        accent: '#8F9EAB',
        tertiary: '#FAFAFA',
        disabled: '#2A2F33',
        error: '#C51700',
        warning: '#E09600',
        info: '#3299BB',
        success: '#71B889',
      },
      text:{
        primary: '#222',
        secondary: '#007A7C',
        accent: '#6d6d6d',
        tertiary: '#FAFAFA',
        disabled: '#AEB8C1',
        error: '#C51700',
        warning: '#E09600',
        info: '#3299BB',
        success: '#71B889',
      },
      border: {
        primary: '#222',
        secondary: '#007A7C',
        accent: '#6d6d6d',
        tertiary: '#FAFAFA',
        disabled: '#AEB8C1',
        error: '#C51700',
        warning: '#E09600',
        info: '#3299BB',
        success: '#71B889',
      },
      icon: {
        primary: '#222',
        secondary: '#007A7C',
        accent: '#6d6d6d',
        tertiary: '#FAFAFA',
        disabled: '#AEB8C1',
        error: '#C51700',
        warning: '#E09600',
        info: '#3299BB',
        success: '#71B889',
      },
      button: {
        primary: '#222',
        secondary: '#007A7C',
        accent: '#6d6d6d',
        tertiary: '#FAFAFA',
        disabled: '#AEB8C1',
        error: '#C51700',
        warning: '#E09600',
        info: '#3299BB',
        success: '#71B889',
      }
    } //return
  }; //static color();
}

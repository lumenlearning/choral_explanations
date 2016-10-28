"use strict";
let webpack = require('webpack');
let path = require('path');

module.exports = new class WpConfig{

  config(env = "development"){
    return {
      entry: "./app.jsx",
      output: {
        path: `${__dirname}/../app/assets/javascripts/`,
        filename: "bundle.js"
      },
      resolve:{
        alias:{
          theme: `${__dirname}/components/_common/theme/theme.jsx`,
          style: './css/style.js',
          actions: `${__dirname}/actions/`,
          stores: `${__dirname}/stores/`
        },
        extensions: ["", ".webpack.js", ".web.js", ".js", '.jsx']
      },
      module:{
        loaders: [
          {
            test: /(\.jsx$|\.js$)/,
            exclude: /(node_modules|bower_components)/,
            loaders: ['babel']
          },
          {
            test: /\.css$/,
            loader: "style-loader!css-loader"
          }
        ]
      },
      plugins: [
        new webpack.DefinePlugin({
          "process.env": {
            NODE_ENV: JSON.stringify(env) //TODO: add from enviornment variable
          }
        })
      ]
    }
  }//config()

  watchSettings(){
    return {}
  }//watchSettings()
};

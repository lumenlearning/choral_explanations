"use strict";
import webpack from 'webpack';
import path from 'path';

export default new class WpConfig{

  config(env = "development"){
    return {
      entry: "./components/app.jsx",
      output: {
        path: path.resolve(__dirname, '../assets/assets/javascripts/'),
        filename: "bundle.js"
      },
      resolve:{
        alias:{
          theme: `${__dirname}/components/_common/_theme/`,
          style: './styles/style.js',
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

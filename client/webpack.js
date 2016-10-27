#!/usr/bin/env node

let Program = require('commander');
let webpack = require('webpack');
let wpConfig = require('./webpack.config.js');


class Bundler {
  constructor(){
    let pg = Program;

    this.constructor.run = this.constructor.run.bind(this);
    this.constructor.watch = this.constructor.watch.bind(this);

    pg
      .version('0.1.1')
      .option('-w', '--watch', 'enable webpack watch')
      .option('-e', '--env [environment]', 'run webpack in specified mode (Default: "development")')
      .parse(process.argv);


    this.compiler = webpack(wpConfig.config(pg.env ? pg.env : 'development'));

    if(pg.W) {
      return this.constructor.watch(wpConfig.watchSettings());
    }
    else {
      return this.constructor.run();
    }

  }

  static run(cb = ()=>{}){
    return this.compiler.run((err, stats)=>{
      if(err) return console.error(err);
      else console.log(stats.toString(true));
    });
  }

  static watch(options = {}){
    return this.compiler.watch(options, (err, stats)=>{
      if(err) return console.error(err);
      else console.log(stats.toString(true));
    });
  }

}

module.exports = new Bundler();
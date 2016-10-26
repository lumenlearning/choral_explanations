#!/usr/bin/env node

import Program from 'commander';
import Webpack from 'webpack';
import wpConfig from './webpack.config.js';


class Bundler {
  constructor(){
    let pg = this.constructor.program;

    pg
      .version('0.1.1')
      .option('-w', '--watch', 'enable webpack watch')
      .option('-e', '--env [environment]', 'run webpack in specified mode (Default: "development")')
      .parse(process.argv);

    this.constructor.compiler(wpConfig.config(pg.env ? pg.env : 'development'));

    if(pg.watch) this.constructor.watch(wpConfig.watchSettings());
    else this.constructor.run();

  }

  static compiler = webpack;
  static program = Program;

  static run(cb = ()=>{}){
    return compiler.run(cb);
  }

  static watch(options = {}){
    return compiler.watch(options);
  }

}
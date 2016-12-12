'use strict';

const webpack = require("webpack");

module.exports = {
  context: __dirname,
  entry: {
    app: "./frontend/src/app.js",
  },
  output: {
    path: __dirname + "/frontend/dist",
    filename: "bundle.js",
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        loader: 'babel-loader'
      },
      {
        test: /\.vue$/,
        loader: 'vue'
      },
      {
        test: /\.s[a|c]ss$/,
        loader: 'style!css!sass'
      }
    ],
  },
  resolveLoader: {
    modules: ['node_modules', __dirname + '/node_modules'],
  }
};

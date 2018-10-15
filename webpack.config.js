const webpack = require('webpack');
const HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
  entry: `${__dirname}/src/main.js`,
  output: {
    path: `${__dirname}/public`,
    filename: 'bundle.js',
  },
  resolve: {
    extensions: ['.js']
  },
  module: {
    loaders: [
      {
        test: /\.tag$/,
        enforce: 'pre',
        exclude: /node_modules/,
        use: [
          {
            loader: 'riot-tag-loader',
            query: {
              type: 'es6',
            }
          }
        ]
      },
      {
        test: /\.(tag|js)$/,
        exclude: /node_modules/,
        loader: 'babel-loader',
        options: {
          presets: ['es2015-riot'],
        }
      },
      {
        test: /\.css$/,
        use: [
          'style-loader',
          'css-loader',
        ],
      },
      {
        test: /\.woff2?(\?v=\d+\.\d+\.\d+)?$/,
        use: 'url-loader',
      },
      {
        test: /\.(ttf|eot|svg)(\?[\s\S]+)?$/,
        use: 'file-loader?name=./[name].[ext]',
      },
    ]
  },
  plugins: [
    new webpack.ProvidePlugin({
      $: 'jquery',
      jQuery: 'jquery',
      'window.jQuery': 'jquery',
      riot: 'riot',
      Popper: ['popper.js', 'default'],
    }),
    new HtmlWebpackPlugin({
      title: 'Riot Markdown Editor',
      template: `${__dirname}/src/index.html`,
      filename: 'index.html',
    }),
  ]
}
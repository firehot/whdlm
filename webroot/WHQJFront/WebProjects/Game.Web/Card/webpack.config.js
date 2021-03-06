const path = require('path')
const webpack = require('webpack')
const CopyWebpackPlugin = require('copy-webpack-plugin')
const HtmlWebpackPlugin = require('html-webpack-plugin')

module.exports = {
  mode: 'development',
  entry: {
    vendor: ['vue', 'vue-router','vuejs-datepicker','moment', 'blueimp-md5'],
    build: './src/main.js'
  },
  output: {
    path: path.resolve(__dirname, 'v2'),
    filename: '[name].js'
  },
  module: {
    rules: [
      {
        test: /\.css$/,
        use: [
          'vue-style-loader',
          {
            loader: 'css-loader'
          }
        ]
      },
      {
        test: /\.vue$/,
        use: [
          {
            loader: 'vue-loader'
          }
        ],
        include: [path.resolve(__dirname, 'src/component')],
        enforce: 'post'
      },
      {
        test: /\.js$/,
        loader: 'babel-loader?cacheDirectory',
        exclude: /node_modules/,
        include: [path.resolve(__dirname, 'src')]
      },
      {
        test: /\.(png|jpg|gif|svg)$/,
        loader: 'file-loader',
        options: {
          name: '[name].[ext]?[hash]'
        },
        include: [path.resolve(__dirname, 'src/assets/images')]
      }
    ]
  },
  resolve: {
    alias: {
      vue$: 'vue/dist/vue.esm.js',
      component: path.resolve(__dirname, 'src/component/')
    },
    extensions: ['*', '.js', '.vue', '.json', '.css'],
    mainFields: ['jsnext:main', 'browser', 'main']
  },
  devServer: {
    historyApiFallback: true,
    noInfo: true,
    overlay: true,
    proxy: {
      '/Card': 'http://172.16.11.58:8081'
    }
  },
  performance: {
    hints: false
  },
  plugins: [
    new CopyWebpackPlugin([
      {
        from: './src/assets',
        to: 'assets'
      }
    ]),
    new HtmlWebpackPlugin({
      template: './src/dev.html',
      filename: 'index.html',
      hash: true,
      inject: true,
      chunksSortMode: 'none'
    })
    // 开启 Scope Hoisting
    // new ModuleConcatenationPlugin(),
    // new webpack.HotModuleReplacementPlugin(),
    // new webpack.optimize.CommonsChunkPlugin("vendor")
  ],
  // devtool: "#eval-source-map",
  watchOptions: {
    ignored: /node_modules/,
    aggregateTimeout: 1000
  },
  externals: {
    // vue: "Vue",
    // vuex: "Vuex",
    // "vue-router": "VueRouter"
  },
  optimization: {
    splitChunks: {
      chunks: 'all'
    }
  },
  stats: {
    children: false
  }
}


###
  This was pillaged from
  https://github.com/felixhao28/using-coffee-react-for-frontend-dev-walkthrough

  - removed sass loader


  TODO:  there has to be a DRYer solution, webpack.production.config.coffee and
      webpack.config.coffee are almost identical

###

webpack = require("webpack")
path = require("path")

module.exports =
  cache: true
  entry: [
    # "webpack-dev-server/client?http://localhost:3000", # WebpackDevServer host and port
    # "webpack/hot/only-dev-server",
    "./src/index" # Main app"s entry point
  ],
  output:
    path: path.join(__dirname, "dist")
    filename: "react-datum.js"
    libraryTarget: "var"
    library: "ReactDatum"
    publicPath: "/dist/"
  externals:
    "jquery": "jQuery"
    "backbone": "Backbone"
    "underscore": "_"
    "react": "React"
    "react-dom": "ReactDOM"
    "react-bootstrap": "Rbs"

  debug: true,

  resolve:
    extensions: ["", ".jsx", ".cjsx", ".coffee", ".js"]
    modulesDirectories: ["src", "node_modules"]

  module:
    loaders: [
        # required to write "require("./style.css")"
        test: /\.css$/
        loader: "style-loader!css-loader"
      ,
        # required for bootstrap icons
        test: /\.(woff|woff2)$/
        loader: "url-loader?prefix=font/&limit=5000&mimetype=application/font-woff"
      ,
        test: /\.ttf$/
        loader: "file-loader?prefix=font/"
      ,
        test: /\.eot$/
        loader: "file-loader?prefix=font/"
      ,
        test: /\.svg$/
        loader: "file-loader?prefix=font/"
      ,
        test: require.resolve("jquery")
        loader: "expose?$"
      ,
        test: require.resolve("jquery")
        loader: "expose?jQuery"
      ,
      #   test: require.resolve("react")
      #   loader: "expose?React"
      # ,
      #   test: /\.jsx$/
      #   loaders: ["react-hot", "jsx-loader?insertPragma=React.DOM"]
      #   include: path.join(__dirname, "src")
      # ,
        test: /\.(cjsx|coffee)$/
        loaders: ["coffee", "cjsx"]
        include: path.join(__dirname, "src")
      ,
        test: /\.(png|jpg)$/
        loader: 'url-loader?limit=8192' # inline base64 URLs for <=8k images, direct URLs for the rest

    ]
  plugins: [
    # #  this adds a lot of code to the bundle for hot loading feature
    # new webpack.HotModuleReplacementPlugin()

    ## We will probably need this plugin at some point
    # new webpack.ProvidePlugin
    #   # Automatically detect jQuery and $ as free var in modules
    #   # and inject the jquery library
    #   # This is required by many jquery plugins
    #   jQuery: "jquery"
    #   $: "jquery"

    ## I think this and changing the debug setting above to `debug: false` above are all that
    ##   should be needed to produce an optimized minified package
    # new webpack.optimize.DedupePlugin(),
    # new webpack.optimize.UglifyJsPlugin
    #  compress:
    #    warnings: false
    #  mangle:
    #    except: ['$super', '$', 'exports', 'require']
  ]

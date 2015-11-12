
React = require('react')
ReactDom = require('react-dom')
$ = jQuery = require('jquery')

Tilegrid = require('./tilegrid')
Model = require('../model')

###
  this extension of the tilegrid allows the use of ReactComponents as the tile template.

  See views/widgets/react/tilegrid for tile grid that can be used as a React component
  from JSX

  Don't pull in to widgets.Tilegrid until we decide to go all in with React.   React is requied
  above which adds 135KB to download the minified version.
###

module.exports = class TilegridReact extends Tilegrid

  # extends - adds support for rendering react components
  setTileTemplate: (tileTemplate) =>
    if @isReactTemplate(tileTemplate)
      @$tileTemplate = tileTemplate
    else
      super    # super will try to coerce tileTemplate into a jQuery object


  isReactTemplate: (template = @_getTileTemplate()) =>
    # TODO : a better way of making this determination. as of 0.14 this is the best I've got
    template = template[0] if _.isArray(template)
    _.intersection(['props', 'type', 'key'], _.keys(template)).length == 3 ||
      template.prototype instanceof React.Component


  # extends - adds support for rendering react components
  _renderTileTemplate: ($tile, model) =>
    template = @_getTileTemplate($tile, model)
    if @isReactTemplate(template)
      # wraps react components in a contextual model object for model associated with this tile
      element = React.createElement(Model, {'model': model}, template)
      reactComponent: ReactDom.render(element, $tile[0])
    else
      super


  # extends super - need to unmount react model
  _renderDerenderedPlaceholder: ($tile) =>
    result = ReactDom.unmountComponentAtNode($tile[0])
    super


  # overrides - returns unmutilated @$tileTemplate
  _getTileTemplate: ($tile, model) =>
    return @$tileTemplate


  # override - normally returns a @$tileTemplate.clone()
  _cloneTileTemplate: () =>
    # this needs to return a jquery element - it's what get's pushed into the grid and our
    # reactive tile will render into it
    if @isReactTemplate()
      return $("<div class='tile'></div>")
    else
      return super

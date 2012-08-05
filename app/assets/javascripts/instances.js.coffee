class ScoreSelectContainer
  constructor: ->
    @scoreNum = 0
    @$container = $('#score-container')

  addPlayers: ($select) ->
    $.ajax(
      url: '/players.json'
    ).done (data) ->
      for player in data
        if player.last_name == null
          name = player.first_name
        else
          name = player.first_name + " " + player.last_name

        opt = $('<option></option>').val(player.id).text(name)
        $select.append opt

  addScore: ->
    html = """
    <div>
      <select class="select" id="instance_scores_attributes_#{@scoreNum}_player_id" name="instance[scores_attributes][#{@scoreNum}][player_id]">
        <option value=''>Choose a player</option>
      </select>
      <input class="numeric decimal required" id="instance_scores_attributes_#{@scoreNum}_score" name="instance[scores_attributes][#{@scoreNum}][score]" placeholder="Score" step="any" type="number">
    </div>
    """
    @$container.append html
    select = $("#instance_scores_attributes_#{@scoreNum}_player_id")
    @addPlayers select
    select.change =>
      @checkIfNewScoreBoxNeeded()
    @scoreNum += 1

  checkIfNewScoreBoxNeeded: ->
    empty = false
    for select in @$container.find('select')
      empty = true unless $(select).val()
    @addScore() unless empty

$ ->
  if $('#score-container').length
    container = new ScoreSelectContainer

# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready () ->
  if $("#statistic_view").length
    initViewChar()

  if $("#statistic_ref").length
    initRefChar()

  if $("#statistic_devices").length
    initDevicesChar()

initViewChar = () ->
    lastDate = null
    totalCount = 0
    dataAssets = {}
    labels = _.filter dataSet, (click) ->
    	date = new Date(moment(click.created_at).format("L"))
    	totalCount++
    	if lastDate != null

        if lastDate < date
        	lastDate = date
        else
          if dataAssets[lastDate]
            dataAssets[lastDate]++
          else
        	   dataAssets[lastDate] = 1

        	return false

    	else
        lastDate = date
        dataAssets[lastDate] = 1
        return true

    labels = _.map labels, (click) -> moment(click.created_at).format "L"

    config = {
        type: 'line',
        data: {
            labels: labels,
            datasets: [{
                label: 'Views',
                data: (() -> _.map dataAssets, (el, key) ->
                	return {t: new Date(key), y: el}
                )(),
                backgroundColor: "#36a2eb"
            }]
        }
    }
    new Chart $("#statistic_view").get(0).getContext('2d'), config
getLocation = (href) ->
    l = document.createElement("a")
    l.href = href
    return l
initRefChar = () ->
  refs = {}
  _.each dataSet, (e) ->
    host = getLocation(e.refer).hostname
    if !e.refer
      host = "Not fonund"

    if refs[host]
        refs[host]++
    else
        refs[host] = 1

  config = {
      type: 'pie',
      data: {
        datasets: [{
          data: ( () -> _.map refs, (e) -> e )(),
          backgroundColor: [
            "#4bc0c0",
            "#ffcd56",
            "#ff9f40",
            "#ff6384",
            "#36a2eb",
          ],
        }],
        labels: ( () -> _.map refs, (e,name) -> name )(),
      },
      options: {
        responsive: true
      }
    }

  new Chart $("#statistic_ref").get(0).getContext('2d'), config
initDevicesChar = () ->
  devices = {}
  _.each dataSet, (e) ->
    type = e.device_type;
    if !e.device_type
      type = "Can't detect"

    if(devices[type])
      devices[type]++
    else
      devices[type] = 1

  config = {
			type: 'pie',
			data: {
				datasets: [{
					data: ( () -> _.map devices, (e) -> e )(),
					backgroundColor: [
						"#36a2eb",
						"#ffcd56",
            "#ff6384",
					],
				}],
				labels: ( () -> _.map devices, (e,name) -> name )(),
			},
			options: {
				responsive: true
			}
	}
  new Chart $("#statistic_devices").get(0).getContext('2d'), config

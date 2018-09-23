
var total_progress = 100
var progress = 0

var input1
var input2

var output1

func _run():
	for i in range(10):
		OS.delay_msec(1000)
		progress += 10
	
	output1 = input1 + " : " + input2

static func _inputs():
	return ["input1", "input2"]

static func _outputs():
	return ["output1"]
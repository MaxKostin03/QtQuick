function getStarPoints(centerX, centerY, outerRadius, innerRadius, points) {
    var angle = Math.PI / points
    var result = []
    for (var i = 0; i < 2 * points; i++) {
        var r = (i % 2 == 0) ? outerRadius : innerRadius
        var currX = centerX + r * Math.sin(i * angle)
        var currY = centerY + r * Math.cos(i * angle)
        result.push(currX)
        result.push(currY)
    }
    return result
}

function getRingPoints(centerX, centerY, radius) {
    var result = []
    var angle = Math.PI / 200
    for (var i = 0; i < 2 * 200; i++){
        var currX = centerX + radius * Math.sin(i * angle)
        var currY = centerY + radius * Math.cos(i * angle)
        result.push(currX)
        result.push(currY)
    }
    return result
}

function getHousePoints(centerX, centerY, width, height) {
    var roofHeight = height
    var roofWidth = width
    var result = []
    result.push(centerX - roofWidth, centerY)
    result.push(centerX, centerY - height / 2)
    result.push(centerX + roofWidth, centerY)
    result.push(centerX + roofWidth, centerY + roofHeight)
    result.push(centerX - roofWidth, centerY + roofHeight)
    return result
}

function getHourglassPoints(centerX, centerY, width, height) {
    var result = []
    result.push(centerX - width, centerY - height)
    result.push(centerX + width, centerY - height)
    result.push(centerX, centerY)
    result.push(centerX - width, centerY + height)
    result.push(centerX + width, centerY + height)
    return result
}

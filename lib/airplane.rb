class Airplane
  attr_reader :name, :wing_loading, :hp, :engine_status

  def initialize(name, wing_loading, horsepower, engine_status = "off", location = "grounded")
    @name = name
    @wing_loading = wing_loading
    @hp = horsepower
    @engine_status = engine_status
    @location = location
  end

  def start
    engine_result = ""
    if @engine_status == "off"
      @engine_status = "on"
      engine_result = "airplane started"
    else
      engine_result = "airplane already started"
    end
    engine_result
  end

  def takeoff
    takeoff_result = ""
    if @engine_status == "off"
      takeoff_result = "airplane not started, please start"
    else @location = "in air"
      takeoff_result = "airplane launched"
    end
    takeoff_result
  end

  def land
    land_result = ""
    if @engine_status == "off"
      land_result = "airplane not started, please start"
    elsif @engine_status == "on" && @location == "grounded"
      land_result = "airplane already on the ground"
    elsif @engine_status == "on" && @location == "in air"
      land_result = "airplane landed"
      @location = "grounded"
    end
    land_result
  end

end

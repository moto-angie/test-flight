require_relative "../../lib/airplane"

describe Airplane do
  let(:my_plane) { my_plane = Airplane.new("cesna", 10, 150) }
  let(:plane_2) { plane_2 = Airplane.new("cesna", 10, 150, "on") }

  describe "#initialization" do
    it "returns name of the airplane" do
      expect(my_plane.name).to eq("cesna")
    end

    it "returns the correct wing loading" do
      expect(my_plane.wing_loading).to eq(10)
    end

    it "returns the correct horsepower" do
      expect(my_plane.hp).to eq(150)
    end
  end

  describe "#start" do
    context "when the engine is off" do
      it "turns the engine on" do
        expect(my_plane.start).to eq("airplane started")
      end
    end

    context "when the engine is already running" do
      it "indicates engine is running" do
        expect(plane_2.start).to eq("airplane already started")
      end
    end
  end

  describe "#land" do
    context "when the engine is not running" do
      it "tells user to turn engine on" do
        expect(my_plane.land).to eq("airplane not started, please start")
      end
    end

    context "when the plane is not in the air" do
      it "indicates plane is grounded" do
        expect(plane_2.land).to eq("airplane already on the ground")
      end
    end

    context "when the engine is on and plane is in the air" do
      it "lands the plane" do
        expect(Airplane.new("cesna", 10, 150, "on", "in air").land).to eq("airplane landed")
      end
    end
  end

  describe "#takeoff" do
    context "when the engine is running" do
      it "initiates takeoff" do
        expect(plane_2.takeoff).to eq("airplane launched")
      end
    end

    context "when the engine is not running" do
      it "indicates engine is off" do
        expect(my_plane.takeoff).to eq("airplane not started, please start")
      end
    end
  end
end

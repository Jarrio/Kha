package kha.input;

@:keep
class Sensor {
	static var accelerometer: Sensor = new Sensor();
	static var gyroscope: Sensor = new Sensor();

	var listeners: Array<Float->Float->Float->Void> = new Array();

	public static function get(type: SensorType): Sensor {
		switch (type) {
			case Accelerometer:
				return accelerometer;
			case Gyroscope:
				return gyroscope;
		}
	}

	public function notify(listener: Float->Float->Float->Void): Void {
		listeners.push(listener);
	}

	function new() {}

	public static function _accelerometerChanged(x: Float, y: Float, z: Float): Void {
		var sensor = get(SensorType.Accelerometer);
		for (listener in sensor.listeners) {
			listener(x, y, z);
		}
	}

	public static function _gyroscopeChanged(x: Float, y: Float, z: Float): Void {
		var sensor = get(SensorType.Gyroscope);
		for (listener in sensor.listeners) {
			listener(x, y, z);
		}
	}
}

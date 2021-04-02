import XCTest
import CX265

final class CX265Tests: XCTestCase {

  func testEncoder() {
    let param = x265_param_alloc()!
    defer {
      x265_param_free(param)
    }
    x265_param_default_preset(param, "fast", nil)
    x265_param_apply_profile(param, "main")
    param.pointee.fpsNum = 30000
    param.pointee.fpsDenom = 1001
    param.pointee.sourceWidth = 1920
    param.pointee.sourceHeight = 1080

    guard let encoder = swift_x265_encoder_open(param) else {
      XCTFail("Could not call macro x265_encoder_open")
      return
    }

    x265_encoder_close(encoder)
  }

  func testAPI() {
    guard let api = swift_x265_api_get(8) else {
      XCTFail("Could not call macro x265_api_get")
      return
    }
    XCTAssertEqual(X265_MAJOR_VERSION, api.pointee.api_major_version) 
  }
}

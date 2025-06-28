import Testing
import CX265

@Test
func openEncoder() throws {
  let param = try #require(x265_param_alloc())
  defer {
    x265_param_free(param)
  }
  x265_param_default_preset(param, "fast", nil)
  x265_param_apply_profile(param, "main")
  param.pointee.fpsNum = 30000
  param.pointee.fpsDenom = 1001
  param.pointee.sourceWidth = 1920
  param.pointee.sourceHeight = 1080

  let encoder = try #require(swift_x265_encoder_open(param))

  x265_encoder_close(encoder)
}

@Test
func getAPI() throws {
  let api = try #require(swift_x265_api_get(8))
  #expect(X265_MAJOR_VERSION == api.pointee.api_major_version)
}

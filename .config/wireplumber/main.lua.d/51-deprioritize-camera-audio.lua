-- Keep camera-attached audio devices off the auto-default rotation.
--
-- The Logitech C920 webcam exposes a microphone, and the HTC Vive USB device
-- shows up as a stereo sink + mic. Both can shadow the real audio devices
-- (G535 headset, built-in speakers) whenever wireplumber re-evaluates the
-- default node - typically on plug events, suspend/resume, or session start.
--
-- Setting priority.driver and priority.session to 0 keeps the devices visible
-- in pavucontrol (so you can still pick them manually for a video call or VR
-- session) but means wireplumber will never pick them as the default sink or
-- source automatically.

table.insert(alsa_monitor.rules, {
  matches = {
    { { "node.name", "matches", "alsa_input.usb-046d_HD_Pro_Webcam_C920_*" } },
    { { "node.name", "matches", "alsa_output.usb-Alpha_Imaging_Tech_HTC_Vive*" } },
    { { "node.name", "matches", "alsa_input.usb-Alpha_Imaging_Tech_HTC_Vive*" } },
  },
  apply_properties = {
    ["priority.driver"]  = 0,
    ["priority.session"] = 0,
    ["session.suspend-timeout-seconds"] = 5,
  },
})

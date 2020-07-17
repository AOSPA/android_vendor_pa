# Copyright 2019-2020 Paranoid Android
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := vendor/pa/prebuilt/audio

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/alarms/A_real_hoot.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/A_real_hoot.ogg \
    $(LOCAL_PATH)/alarms/Bright_morning.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Bright_morning.ogg \
    $(LOCAL_PATH)/alarms/Cuckoo_clock.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Cuckoo_clock.ogg \
    $(LOCAL_PATH)/alarms/Early_twilight.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Early_twilight.ogg \
    $(LOCAL_PATH)/alarms/Full_of_wonder.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Full_of_wonder.ogg \
    $(LOCAL_PATH)/alarms/Gentle_breeze.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Gentle_breeze.ogg \
    $(LOCAL_PATH)/alarms/Icicles.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Icicles.ogg \
    $(LOCAL_PATH)/alarms/Jump_start.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Jump_start.ogg \
    $(LOCAL_PATH)/alarms/Loose_change.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Loose_change.ogg \
    $(LOCAL_PATH)/alarms/Rolling_fog.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Rolling_fog.ogg \
    $(LOCAL_PATH)/alarms/Spokes.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Spokes.ogg \
    $(LOCAL_PATH)/alarms/Sunshower.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Sunshower.ogg \
    $(LOCAL_PATH)/notifications/Beginning.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Beginning.ogg \
    $(LOCAL_PATH)/notifications/Coconuts.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Coconuts.ogg \
    $(LOCAL_PATH)/notifications/Duet.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Duet.ogg \
    $(LOCAL_PATH)/notifications/End_note.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/End_note.ogg \
    $(LOCAL_PATH)/notifications/Gentle_gong.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Gentle_gong.ogg \
    $(LOCAL_PATH)/notifications/Mallet.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Mallet.ogg \
    $(LOCAL_PATH)/notifications/Orders_up.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Orders_up.ogg \
    $(LOCAL_PATH)/notifications/Ping.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Ping.ogg \
    $(LOCAL_PATH)/notifications/Pipes.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Pipes.ogg \
    $(LOCAL_PATH)/notifications/Popcorn.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Popcorn.ogg \
    $(LOCAL_PATH)/notifications/Shopkeeper.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Shopkeeper.ogg \
    $(LOCAL_PATH)/notifications/Sticks_and_stones.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Sticks_and_stones.ogg \
    $(LOCAL_PATH)/notifications/Tuneup.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Tuneup.ogg \
    $(LOCAL_PATH)/notifications/Tweeter.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Tweeter.ogg \
    $(LOCAL_PATH)/notifications/Twinkle.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/Twinkle.ogg \
    $(LOCAL_PATH)/ringtones/Copycat.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/Copycat.ogg \
    $(LOCAL_PATH)/ringtones/Crackle.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/Crackle.ogg \
    $(LOCAL_PATH)/ringtones/Flutterby.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/Flutterby.ogg \
    $(LOCAL_PATH)/ringtones/Hotline.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/Hotline.ogg \
    $(LOCAL_PATH)/ringtones/Leaps_and_bounds.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/Leaps_and_bounds.ogg \
    $(LOCAL_PATH)/ringtones/Lollipop.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/Lollipop.ogg \
    $(LOCAL_PATH)/ringtones/Lost_and_found.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/Lost_and_found.ogg \
    $(LOCAL_PATH)/ringtones/Mash_up.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/Mash_up.ogg \
    $(LOCAL_PATH)/ringtones/Monkey_around.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/Monkey_around.ogg \
    $(LOCAL_PATH)/ringtones/Schools_out.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/Schools_out.ogg \
    $(LOCAL_PATH)/ringtones/The_big_adventure.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/The_big_adventure.ogg \
    $(LOCAL_PATH)/ringtones/Zen_too.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/Zen_too.ogg \
    $(LOCAL_PATH)/ui/audio_end.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/audio_end.ogg \
    $(LOCAL_PATH)/ui/audio_initiate.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/audio_initiate.ogg \
    $(LOCAL_PATH)/ui/camera_click.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/camera_click.ogg \
    $(LOCAL_PATH)/ui/camera_focus.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/camera_focus.ogg \
    $(LOCAL_PATH)/ui/ChargingStarted.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/ChargingStarted.ogg \
    $(LOCAL_PATH)/ui/Dock.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/Dock.ogg \
    $(LOCAL_PATH)/ui/Effect_Tick.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/Effect_Tick.ogg \
    $(LOCAL_PATH)/ui/InCallNotification.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/InCallNotification.ogg \
    $(LOCAL_PATH)/ui/KeypressDelete.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/KeypressDelete.ogg \
    $(LOCAL_PATH)/ui/KeypressInvalid.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/KeypressInvalid.ogg \
    $(LOCAL_PATH)/ui/KeypressReturn.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/KeypressReturn.ogg \
    $(LOCAL_PATH)/ui/KeypressSpacebar.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/KeypressSpacebar.ogg \
    $(LOCAL_PATH)/ui/KeypressStandard.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/KeypressStandard.ogg \
    $(LOCAL_PATH)/ui/Lock.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/Lock.ogg \
    $(LOCAL_PATH)/ui/LowBattery.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/LowBattery.ogg \
    $(LOCAL_PATH)/ui/NFCFailure.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/NFCFailure.ogg \
    $(LOCAL_PATH)/ui/NFCInitiated.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/NFCInitiated.ogg \
    $(LOCAL_PATH)/ui/NFCSuccess.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/NFCSuccess.ogg \
    $(LOCAL_PATH)/ui/NFCTransferComplete.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/NFCTransferComplete.ogg \
    $(LOCAL_PATH)/ui/NFCTransferInitiated.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/NFCTransferInitiated.ogg \
    $(LOCAL_PATH)/ui/Trusted.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/Trusted.ogg \
    $(LOCAL_PATH)/ui/Undock.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/Undock.ogg \
    $(LOCAL_PATH)/ui/Unlock.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/Unlock.ogg \
    $(LOCAL_PATH)/ui/VideoRecord.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/VideoRecord.ogg \
    $(LOCAL_PATH)/ui/VideoStop.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/VideoStop.ogg \
    $(LOCAL_PATH)/ui/WirelessChargingStarted.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/WirelessChargingStarted.ogg

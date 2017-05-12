ESP_BAUD	:= 921600
ESP_PORT	:= COM5

BIN_DIR		:= "Z:/TermShare/oven_meter"

.PHONY: all clean flash

flash:
	esptool -p $(ESP_PORT) -b $(ESP_BAUD) write_flash 0 $(BIN_DIR)/0x00000.bin 0x10000 $(BIN_DIR)/0x10000.bin --verify
	
all: flash init blank

init:
	esptool -p $(ESP_PORT) -b $(ESP_BAUD) write_flash 0x3fc000 $(BIN_DIR)/esp_init_data_default.bin --verify
	
blank:
	esptool -p $(ESP_PORT) -b $(ESP_BAUD) write_flash 0x7e000 $(BIN_DIR)/blank.bin 0x3fe000 $(BIN_DIR)/blank.bin --verify
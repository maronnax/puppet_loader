PYTHON = .venv/bin/python

install:
	brew install ffmpeg
	python3 -m venv --copies --prompt puppetnet .venv
	.venv/bin/pip install zmq
	.venv/bin/pip install pygame
	.venv/bin/pip install ipython
	.venv/bin/pip install emacsipython
	.venv/bin/pip install -e .
	mkdir -p inputs
	mkdir -p outputs/programs


.PHONY: all

upload-all:
	sh upload_all_animations

all: $(PROGRAM_DIRS)
all-demos: $(DEMO_TARGETS)
all-uploads: $(UPLOAD_TARGETS)

inputs/aloha/aloha.mp3: inputs/aloha/aloha.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.2" $@

outputs/programs/aloha: inputs/aloha/aloha.mp3
	$(PYTHON) ./bin/compile-animation inputs/aloha/aloha.json \
		inputs/aloha/aloha.mp3 \
		outputs/programs/aloha \
		--force --frame-rate 24 \
		--insert-frames 5

aloha-demo: aloha-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play aloha

aloha-upload: outputs/programs/aloha
	./$(PYTHON) bin/upload-program outputs/programs/aloha

inputs/bye_bye_1/bye_bye_1.mp3: inputs/bye_bye_1/bye_bye_1.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/bye_bye_1: inputs/bye_bye_1/bye_bye_1.mp3
	$(PYTHON) ./bin/compile-animation inputs/bye_bye_1/bye_bye_1.json \
		inputs/bye_bye_1/bye_bye_1.mp3 \
		outputs/programs/bye_bye_1 \
		--force --frame-rate 24

bye_bye_1-demo: bye_bye_1-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play bye_bye_1

bye_bye_1-upload: outputs/programs/bye_bye_1
	$(PYTHON) bin/upload-program outputs/programs/bye_bye_1

inputs/bye_bye_2/bye_bye_2.mp3: inputs/bye_bye_2/bye_bye_2.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/bye_bye_2: inputs/bye_bye_2/bye_bye_2.mp3
	$(PYTHON) ./bin/compile-animation inputs/bye_bye_2/bye_bye_2.json \
		inputs/bye_bye_2/bye_bye_2.mp3 \
		outputs/programs/bye_bye_2 \
		--force --frame-rate 24 \

bye_bye_2-demo: bye_bye_2-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play bye_bye_2

bye_bye_2-upload: outputs/programs/bye_bye_2
	$(PYTHON) bin/upload-program outputs/programs/bye_bye_2


inputs/candy_popcorn/candy_popcorn.mp3: inputs/candy_popcorn/candy_popcorn.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/candy_popcorn: inputs/candy_popcorn/candy_popcorn.mp3
	$(PYTHON) ./bin/compile-animation inputs/candy_popcorn/candy_popcorn.json \
		inputs/candy_popcorn/candy_popcorn.mp3 \
		outputs/programs/candy_popcorn \
		--force --frame-rate 24 \

candy_popcorn-demo: candy_popcorn-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play candy_popcorn

candy_popcorn-upload: outputs/programs/candy_popcorn
	$(PYTHON) bin/upload-program outputs/programs/candy_popcorn
inputs/gimme_gimme/gimme_gimme.mp3: inputs/gimme_gimme/gimme_gimme.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/gimme_gimme: inputs/gimme_gimme/gimme_gimme.mp3
	$(PYTHON) ./bin/compile-animation inputs/gimme_gimme/gimme_gimme.json \
		inputs/gimme_gimme/gimme_gimme.mp3 \
		outputs/programs/gimme_gimme \
		--force --frame-rate 24 \

gimme_gimme-demo: gimme_gimme-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play gimme_gimme

gimme_gimme-upload: outputs/programs/gimme_gimme
	$(PYTHON) bin/upload-program outputs/programs/gimme_gimme
inputs/give_give/give_give.mp3: inputs/give_give/give_give.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/give_give: inputs/give_give/give_give.mp3
	$(PYTHON) ./bin/compile-animation inputs/give_give/give_give.json \
		inputs/give_give/give_give.mp3 \
		outputs/programs/give_give \
		--force --frame-rate 24 \

give_give-demo: give_give-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play give_give

give_give-upload: outputs/programs/give_give
	$(PYTHON) bin/upload-program outputs/programs/give_give

inputs/heh_woo_snacks/heh_woo_snacks.mp3: inputs/heh_woo_snacks/heh_woo_snacks.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/heh_woo_snacks: inputs/heh_woo_snacks/heh_woo_snacks.mp3
	$(PYTHON) ./bin/compile-animation inputs/heh_woo_snacks/heh_woo_snacks.json \
		inputs/heh_woo_snacks/heh_woo_snacks.mp3 \
		outputs/programs/heh_woo_snacks \
		--force --frame-rate 24 \

heh_woo_snacks-demo: heh_woo_snacks-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play heh_woo_snacks

heh_woo_snacks-upload: outputs/programs/heh_woo_snacks
	$(PYTHON) bin/upload-program outputs/programs/heh_woo_snacks

inputs/here_we_go/here_we_go.mp3: inputs/here_we_go/here_we_go.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/here_we_go: inputs/here_we_go/here_we_go.mp3
	$(PYTHON) ./bin/compile-animation inputs/here_we_go/here_we_go.json \
		inputs/here_we_go/here_we_go.mp3 \
		outputs/programs/here_we_go \
		--force --frame-rate 24 \

here_we_go-demo: here_we_go-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play here_we_go

here_we_go-upload: outputs/programs/here_we_go
	$(PYTHON) bin/upload-program outputs/programs/here_we_go
inputs/hurry_hurry_take_my_picture/hurry_hurry_take_my_picture.mp3: inputs/hurry_hurry_take_my_picture/hurry_hurry_take_my_picture.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/hurry_hurry_take_my_picture: inputs/hurry_hurry_take_my_picture/hurry_hurry_take_my_picture.mp3
	$(PYTHON) ./bin/compile-animation inputs/hurry_hurry_take_my_picture/hurry_hurry_take_my_picture.json \
		inputs/hurry_hurry_take_my_picture/hurry_hurry_take_my_picture.mp3 \
		outputs/programs/hurry_hurry_take_my_picture \
		--force --frame-rate 24 \

hurry_hurry_take_my_picture-demo: hurry_hurry_take_my_picture-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play hurry_hurry_take_my_picture

hurry_hurry_take_my_picture-upload: outputs/programs/hurry_hurry_take_my_picture
	$(PYTHON) bin/upload-program outputs/programs/hurry_hurry_take_my_picture
inputs/mahalo1/mahalo1.mp3: inputs/mahalo1/mahalo1.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/mahalo1: inputs/mahalo1/mahalo1.mp3
	$(PYTHON) ./bin/compile-animation inputs/mahalo1/mahalo1.json \
		inputs/mahalo1/mahalo1.mp3 \
		outputs/programs/mahalo1 \
		--force --frame-rate 24 \

mahalo1-demo: mahalo1-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play mahalo1

mahalo1-upload: outputs/programs/mahalo1
	$(PYTHON) bin/upload-program outputs/programs/mahalo1

inputs/mahalo2/mahalo2.mp3: inputs/mahalo2/mahalo2.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/mahalo2: inputs/mahalo2/mahalo2.mp3
	$(PYTHON) ./bin/compile-animation inputs/mahalo2/mahalo2.json \
		inputs/mahalo2/mahalo2.mp3 \
		outputs/programs/mahalo2 \
		--force --frame-rate 24 \
		--insert-frames 5

mahalo2-demo: mahalo2-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play mahalo2

mahalo2-upload: outputs/programs/mahalo2
	$(PYTHON) bin/upload-program outputs/programs/mahalo2

inputs/ohh_stitch_needs_popcorn/ohh_stitch_needs_popcorn.mp3: inputs/ohh_stitch_needs_popcorn/ohh_stitch_needs_popcorn.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/ohh_stitch_needs_popcorn: inputs/ohh_stitch_needs_popcorn/ohh_stitch_needs_popcorn.mp3
	$(PYTHON) ./bin/compile-animation inputs/ohh_stitch_needs_popcorn/ohh_stitch_needs_popcorn.json \
		inputs/ohh_stitch_needs_popcorn/ohh_stitch_needs_popcorn.mp3 \
		outputs/programs/ohh_stitch_needs_popcorn \
		--force --frame-rate 24 \

ohh_stitch_needs_popcorn-demo: ohh_stitch_needs_popcorn-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play ohh_stitch_needs_popcorn

ohh_stitch_needs_popcorn-upload: outputs/programs/ohh_stitch_needs_popcorn
	$(PYTHON) bin/upload-program outputs/programs/ohh_stitch_needs_popcorn


inputs/snacks1/snacks1.mp3: inputs/snacks1/snacks1.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/snacks1: inputs/snacks1/snacks1.mp3
	$(PYTHON) ./bin/compile-animation inputs/snacks1/snacks1.json \
		inputs/snacks1/snacks1.mp3 \
		outputs/programs/snacks1 \
		--force --frame-rate 24 \

snacks1-demo: snacks1-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play snacks1

snacks1-upload: outputs/programs/snacks1
	$(PYTHON) bin/upload-program outputs/programs/snacks1

inputs/snacks2/snacks2.mp3: inputs/snacks2/snacks2.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/snacks2: inputs/snacks2/snacks2.mp3
	$(PYTHON) ./bin/compile-animation inputs/snacks2/snacks2.json \
		inputs/snacks2/snacks2.mp3 \
		outputs/programs/snacks2 \
		--force --frame-rate 24 \

snacks2-demo: snacks2-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play snacks2

snacks2-upload: outputs/programs/snacks2
	$(PYTHON) bin/upload-program outputs/programs/snacks2
inputs/snacks3/snacks3.mp3: inputs/snacks3/snacks3.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/snacks3: inputs/snacks3/snacks3.mp3
	$(PYTHON) ./bin/compile-animation inputs/snacks3/snacks3.json \
		inputs/snacks3/snacks3.mp3 \
		outputs/programs/snacks3 \
		--force --frame-rate 24 \

snacks3-demo: snacks3-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play snacks3

snacks3-upload: outputs/programs/snacks3
	$(PYTHON) bin/upload-program outputs/programs/snacks3

inputs/stitch_made_himself_pretty/stitch_made_himself_pretty.mp3: inputs/stitch_made_himself_pretty/stitch_made_himself_pretty.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/stitch_made_himself_pretty: inputs/stitch_made_himself_pretty/stitch_made_himself_pretty.mp3
	$(PYTHON) ./bin/compile-animation inputs/stitch_made_himself_pretty/stitch_made_himself_pretty.json \
		inputs/stitch_made_himself_pretty/stitch_made_himself_pretty.mp3 \
		outputs/programs/stitch_made_himself_pretty \
		--force --frame-rate 24 \

stitch_made_himself_pretty-demo: stitch_made_himself_pretty-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play stitch_made_himself_pretty

stitch_made_himself_pretty-upload: outputs/programs/stitch_made_himself_pretty
	$(PYTHON) bin/upload-program outputs/programs/stitch_made_himself_pretty

inputs/give_give_give_stitch_want_stitch_want/give_give_give_stitch_want_stitch_want.mp3: inputs/give_give_give_stitch_want_stitch_want/give_give_give_stitch_want_stitch_want.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/give_give_give_stitch_want_stitch_want: inputs/give_give_give_stitch_want_stitch_want/give_give_give_stitch_want_stitch_want.mp3
	$(PYTHON) ./bin/compile-animation inputs/give_give_give_stitch_want_stitch_want/give_give_give_stitch_want_stitch_want.json \
		inputs/give_give_give_stitch_want_stitch_want/give_give_give_stitch_want_stitch_want.mp3 \
		outputs/programs/give_give_give_stitch_want_stitch_want \
		--force --frame-rate 24

give_give_give_stitch_want_stitch_want-demo: give_give_give_stitch_want_stitch_want-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play give_give_give_stitch_want_stitch_want

give_give_give_stitch_want_stitch_want-upload: outputs/programs/give_give_give_stitch_want_stitch_want
	$(PYTHON) bin/upload-program outputs/programs/give_give_give_stitch_want_stitch_want


inputs/here_we_go_hee_hee/here_we_go_hee_hee.mp3: inputs/here_we_go_hee_hee/here_we_go_hee_hee.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/here_we_go_hee_hee: inputs/here_we_go_hee_hee/here_we_go_hee_hee.mp3
	$(PYTHON) ./bin/compile-animation inputs/here_we_go_hee_hee/here_we_go_hee_hee.json \
		inputs/here_we_go_hee_hee/here_we_go_hee_hee.mp3 \
		outputs/programs/here_we_go_hee_hee \
		--force --frame-rate 24

here_we_go_hee_hee-demo: here_we_go_hee_hee-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play here_we_go_hee_hee

here_we_go_hee_hee-upload: outputs/programs/here_we_go_hee_hee
	$(PYTHON) bin/upload-program outputs/programs/here_we_go_hee_hee

inputs/stitch_needs_snacks/stitch_needs_snacks.mp3: inputs/stitch_needs_snacks/stitch_needs_snacks.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/stitch_needs_snacks: inputs/stitch_needs_snacks/stitch_needs_snacks.mp3
	$(PYTHON) ./bin/compile-animation inputs/stitch_needs_snacks/stitch_needs_snacks.json \
		inputs/stitch_needs_snacks/stitch_needs_snacks.mp3 \
		outputs/programs/stitch_needs_snacks \
		--force --frame-rate 24

stitch_needs_snacks-demo: stitch_needs_snacks-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play stitch_needs_snacks

stitch_needs_snacks-upload: outputs/programs/stitch_needs_snacks
	$(PYTHON) bin/upload-program outputs/programs/stitch_needs_snacks

inputs/wee_fun_fun_fun/wee_fun_fun_fun.mp3: inputs/wee_fun_fun_fun/wee_fun_fun_fun.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/wee_fun_fun_fun: inputs/wee_fun_fun_fun/wee_fun_fun_fun.mp3
	$(PYTHON) ./bin/compile-animation inputs/wee_fun_fun_fun/wee_fun_fun_fun.json \
		inputs/wee_fun_fun_fun/wee_fun_fun_fun.mp3 \
		outputs/programs/wee_fun_fun_fun \
		--force --frame-rate 24 \

wee_fun_fun_fun-demo: wee_fun_fun_fun-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play wee_fun_fun_fun

wee_fun_fun_fun-upload: outputs/programs/wee_fun_fun_fun
	$(PYTHON) bin/upload-program outputs/programs/wee_fun_fun_fun

inputs/wee_hee_hee_hee/wee_hee_hee_hee.mp3: inputs/wee_hee_hee_hee/wee_hee_hee_hee.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/wee_hee_hee_hee: inputs/wee_hee_hee_hee/wee_hee_hee_hee.mp3
	$(PYTHON) ./bin/compile-animation inputs/wee_hee_hee_hee/wee_hee_hee_hee.json \
		inputs/wee_hee_hee_hee/wee_hee_hee_hee.mp3 \
		outputs/programs/wee_hee_hee_hee \
		--force --frame-rate 24 \

wee_hee_hee_hee-demo: wee_hee_hee_hee-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play wee_hee_hee_hee

wee_hee_hee_hee-upload: outputs/programs/wee_hee_hee_hee
	$(PYTHON) bin/upload-program outputs/programs/wee_hee_hee_hee

inputs/weeee/weeee.mp3: inputs/weeee/weeee.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/weeee: inputs/weeee/weeee.mp3
	$(PYTHON) ./bin/compile-animation inputs/weeee/weeee.json \
		inputs/weeee/weeee.mp3 \
		outputs/programs/weeee \
		--force --frame-rate 24 \

weeee-demo: weeee-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play weeee

weeee-upload: outputs/programs/weeee
	$(PYTHON) bin/upload-program outputs/programs/weeee


inputs/wee_hee_hee_fun/wee_hee_hee_fun.mp3: inputs/wee_hee_hee_fun/wee_hee_hee_fun.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/wee_hee_hee_fun: inputs/wee_hee_hee_fun/wee_hee_hee_fun.mp3
	$(PYTHON) ./bin/compile-animation inputs/wee_hee_hee_fun/wee_hee_hee_fun.json \
		inputs/wee_hee_hee_fun/wee_hee_hee_fun.mp3 \
		outputs/programs/wee_hee_hee_fun \
		--force --frame-rate 24

wee_hee_hee_fun-demo: wee_hee_hee_fun-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play wee_hee_hee_fun

wee_hee_hee_fun-upload: outputs/programs/wee_hee_hee_fun
	$(PYTHON) bin/upload-program outputs/programs/wee_hee_hee_fun

inputs/woo_popcorn_yummy/woo_popcorn_yummy.mp3: inputs/woo_popcorn_yummy/woo_popcorn_yummy.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/woo_popcorn_yummy: inputs/woo_popcorn_yummy/woo_popcorn_yummy.mp3
	$(PYTHON) ./bin/compile-animation inputs/woo_popcorn_yummy/woo_popcorn_yummy.json \
		inputs/woo_popcorn_yummy/woo_popcorn_yummy.mp3 \
		outputs/programs/woo_popcorn_yummy \
		--force --frame-rate 24

woo_popcorn_yummy-demo: woo_popcorn_yummy-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play woo_popcorn_yummy

woo_popcorn_yummy-upload: outputs/programs/woo_popcorn_yummy
	$(PYTHON) bin/upload-program outputs/programs/woo_popcorn_yummy

inputs/yah_take_my_picture_yah/yah_take_my_picture_yah.mp3: inputs/yah_take_my_picture_yah/yah_take_my_picture_yah.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/yah_take_my_picture_yah: inputs/yah_take_my_picture_yah/yah_take_my_picture_yah.mp3
	$(PYTHON) ./bin/compile-animation inputs/yah_take_my_picture_yah/yah_take_my_picture_yah.json \
		inputs/yah_take_my_picture_yah/yah_take_my_picture_yah.mp3 \
		outputs/programs/yah_take_my_picture_yah \
		--force --frame-rate 24 \

yah_take_my_picture_yah-demo: yah_take_my_picture_yah-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play yah_take_my_picture_yah

yah_take_my_picture_yah-upload: outputs/programs/yah_take_my_picture_yah
	$(PYTHON) bin/upload-program outputs/programs/yah_take_my_picture_yah

inputs/yay_woohoo_here_we_go_haha/yay_woohoo_here_we_go_haha.mp3: inputs/yay_woohoo_here_we_go_haha/yay_woohoo_here_we_go_haha.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/yay_woohoo_here_we_go_haha: inputs/yay_woohoo_here_we_go_haha/yay_woohoo_here_we_go_haha.mp3
	$(PYTHON) ./bin/compile-animation inputs/yay_woohoo_here_we_go_haha/yay_woohoo_here_we_go_haha.json \
		inputs/yay_woohoo_here_we_go_haha/yay_woohoo_here_we_go_haha.mp3 \
		outputs/programs/yay_woohoo_here_we_go_haha \
		--force --frame-rate 24 \

yay_woohoo_here_we_go_haha-demo: yay_woohoo_here_we_go_haha-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play yay_woohoo_here_we_go_haha

yay_woohoo_here_we_go_haha-upload: outputs/programs/yay_woohoo_here_we_go_haha
	$(PYTHON) bin/upload-program outputs/programs/yay_woohoo_here_we_go_haha

inputs/yay_woohoo_here_we_go_hee_hee/yay_woohoo_here_we_go_hee_hee.mp3: inputs/yay_woohoo_here_we_go_hee_hee/yay_woohoo_here_we_go_hee_hee.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/yay_woohoo_here_we_go_hee_hee: inputs/yay_woohoo_here_we_go_hee_hee/yay_woohoo_here_we_go_hee_hee.mp3
	$(PYTHON) ./bin/compile-animation inputs/yay_woohoo_here_we_go_hee_hee/yay_woohoo_here_we_go_hee_hee.json \
		inputs/yay_woohoo_here_we_go_hee_hee/yay_woohoo_here_we_go_hee_hee.mp3 \
		outputs/programs/yay_woohoo_here_we_go_hee_hee \
		--force --frame-rate 24 \

yay_woohoo_here_we_go_hee_hee-demo: yay_woohoo_here_we_go_hee_hee-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play yay_woohoo_here_we_go_hee_hee

yay_woohoo_here_we_go_hee_hee-upload: outputs/programs/yay_woohoo_here_we_go_hee_hee
	$(PYTHON) bin/upload-program outputs/programs/yay_woohoo_here_we_go_hee_hee

inputs/big_hello/big_hello.mp3: inputs/big_hello/big_hello.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.0" $@

outputs/programs/big_hello: inputs/big_hello/big_hello.mp3
	$(PYTHON) ./bin/compile-animation inputs/big_hello/big_hello.json \
		inputs/big_hello/big_hello.mp3 \
		outputs/programs/big_hello \
		--force --frame-rate 24 \

big_hello-demo: big_hello-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play big_hello

big_hello-upload: outputs/programs/big_hello
	$(PYTHON) bin/upload-program outputs/programs/big_hello

inputs/nja_test/nja_test.mp3: inputs/nja_test/nja_test.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/nja_test: inputs/nja_test/nja_test.mp3
	$(PYTHON) ./bin/compile-animation inputs/nja_test/nja_test.json \
		inputs/nja_test/nja_test.mp3 \
		outputs/programs/nja_test \
		--force --frame-rate 24 \

nja_test-demo: nja_test-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play nja_test

nja_test-upload: outputs/programs/nja_test
	$(PYTHON) bin/upload-program outputs/programs/nja_test


inputs/alan1/alan1.mp3: inputs/alan1/alan1.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=0.8" $@

outputs/programs/alan1: inputs/alan1/alan1.mp3
	$(PYTHON) ./bin/compile-animation inputs/alan1/alan1.json \
		inputs/alan1/alan1.mp3 \
		outputs/programs/alan1 \
		--force --frame-rate 24 \

alan1-demo: alan1-upload
		sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play alan1

alan1-upload: outputs/programs/alan1
	$(PYTHON) bin/upload-program outputs/programs/alan1


inputs/welcome_alan_bergman1/welcome_alan_bergman1.mp3: inputs/welcome_alan_bergman1/welcome_alan_bergman1.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/welcome_alan_bergman1: inputs/welcome_alan_bergman1/welcome_alan_bergman1.mp3
	$(PYTHON) ./bin/compile-animation inputs/welcome_alan_bergman1/welcome_alan_bergman1.json \
		inputs/welcome_alan_bergman1/welcome_alan_bergman1.mp3 \
		outputs/programs/welcome_alan_bergman1 \
		--force --frame-rate 24 \

welcome_alan_bergman1-demo: welcome_alan_bergman1-upload
		sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play welcome_alan_bergman1

welcome_alan_bergman1-upload: outputs/programs/welcome_alan_bergman1
	$(PYTHON) bin/upload-program outputs/programs/welcome_alan_bergman1



inputs/welcome_alan_bergman2/welcome_alan_bergman2.mp3: inputs/welcome_alan_bergman2/welcome_alan_bergman2.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/welcome_alan_bergman2: inputs/welcome_alan_bergman2/welcome_alan_bergman2.mp3
	$(PYTHON) ./bin/compile-animation inputs/welcome_alan_bergman2/welcome_alan_bergman2.json \
		inputs/welcome_alan_bergman2/welcome_alan_bergman2.mp3 \
		outputs/programs/welcome_alan_bergman2 \
		--force --frame-rate 24 \

welcome_alan_bergman2-demo: welcome_alan_bergman2-upload
		sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play welcome_alan_bergman2

welcome_alan_bergman2-upload: outputs/programs/welcome_alan_bergman2
	$(PYTHON) bin/upload-program outputs/programs/welcome_alan_bergman2

inputs/no_touch_stitch_1/no_touch_stitch_1.mp3: inputs/no_touch_stitch_1/no_touch_stitch_1.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/no_touch_stitch_1: inputs/no_touch_stitch_1/no_touch_stitch_1.mp3
	$(PYTHON) ./bin/compile-animation inputs/no_touch_stitch_1/no_touch_stitch_1.json \
		inputs/no_touch_stitch_1/no_touch_stitch_1.mp3 \
		outputs/programs/no_touch_stitch_1 \
		--force --frame-rate 24 \

no_touch_stitch_1-demo: no_touch_stitch_1-upload
		sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play no_touch_stitch_1

no_touch_stitch_1-upload: outputs/programs/no_touch_stitch_1
	$(PYTHON) bin/upload-program outputs/programs/no_touch_stitch_1


inputs/no_touch_stitch_2/no_touch_stitch_2.mp3: inputs/no_touch_stitch_2/no_touch_stitch_2.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/no_touch_stitch_2: inputs/no_touch_stitch_2/no_touch_stitch_2.mp3
	$(PYTHON) ./bin/compile-animation inputs/no_touch_stitch_2/no_touch_stitch_2.json \
		inputs/no_touch_stitch_2/no_touch_stitch_2.mp3 \
		outputs/programs/no_touch_stitch_2 \
		--force --frame-rate 24 \

no_touch_stitch_2-demo: no_touch_stitch_2-upload
		sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play no_touch_stitch_2

no_touch_stitch_2-upload: outputs/programs/no_touch_stitch_2
	$(PYTHON) bin/upload-program outputs/programs/no_touch_stitch_2



inputs/no_touch_stitch_3/no_touch_stitch_3.mp3: inputs/no_touch_stitch_3/no_touch_stitch_3.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/no_touch_stitch_3: inputs/no_touch_stitch_3/no_touch_stitch_3.mp3
	$(PYTHON) ./bin/compile-animation inputs/no_touch_stitch_3/no_touch_stitch_3.json \
		inputs/no_touch_stitch_3/no_touch_stitch_3.mp3 \
		outputs/programs/no_touch_stitch_3 \
		--force --frame-rate 24 \

no_touch_stitch_3-demo: no_touch_stitch_3-upload
		sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play no_touch_stitch_3

no_touch_stitch_3-upload: outputs/programs/no_touch_stitch_3
	$(PYTHON) bin/upload-program outputs/programs/no_touch_stitch_3


inputs/stitch_giggle_1/stitch_giggle_1.mp3: inputs/stitch_giggle_1/stitch_giggle_1.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/stitch_giggle_1: inputs/stitch_giggle_1/stitch_giggle_1.mp3
	$(PYTHON) ./bin/compile-animation inputs/stitch_giggle_1/stitch_giggle_1.json \
		inputs/stitch_giggle_1/stitch_giggle_1.mp3 \
		outputs/programs/stitch_giggle_1 \
		--force --frame-rate 24 \

stitch_giggle_1-demo: stitch_giggle_1-upload
		sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play stitch_giggle_1

stitch_giggle_1-upload: outputs/programs/stitch_giggle_1
	$(PYTHON) bin/upload-program outputs/programs/stitch_giggle_1


inputs/stitch_giggle_2/stitch_giggle_2.mp3: inputs/stitch_giggle_2/stitch_giggle_2.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/stitch_giggle_2: inputs/stitch_giggle_2/stitch_giggle_2.mp3
	$(PYTHON) ./bin/compile-animation inputs/stitch_giggle_2/stitch_giggle_2.json \
		inputs/stitch_giggle_2/stitch_giggle_2.mp3 \
		outputs/programs/stitch_giggle_2 \
		--force --frame-rate 24 \

stitch_giggle_2-demo: stitch_giggle_2-upload
		sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play stitch_giggle_2

stitch_giggle_2-upload: outputs/programs/stitch_giggle_2
	$(PYTHON) bin/upload-program outputs/programs/stitch_giggle_2


inputs/stitch_giggle_3/stitch_giggle_3.mp3: inputs/stitch_giggle_3/stitch_giggle_3.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/stitch_giggle_3: inputs/stitch_giggle_3/stitch_giggle_3.mp3
	$(PYTHON) ./bin/compile-animation inputs/stitch_giggle_3/stitch_giggle_3.json \
		inputs/stitch_giggle_3/stitch_giggle_3.mp3 \
		outputs/programs/stitch_giggle_3 \
		--force --frame-rate 24 \

stitch_giggle_3-demo: stitch_giggle_3-upload
		sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play stitch_giggle_3

stitch_giggle_3-upload: outputs/programs/stitch_giggle_3
	$(PYTHON) bin/upload-program outputs/programs/stitch_giggle_3




inputs/stitch_giggle_4/stitch_giggle_4.mp3: inputs/stitch_giggle_4/stitch_giggle_4.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/stitch_giggle_4: inputs/stitch_giggle_4/stitch_giggle_4.mp3
	$(PYTHON) ./bin/compile-animation inputs/stitch_giggle_4/stitch_giggle_4.json \
		inputs/stitch_giggle_4/stitch_giggle_4.mp3 \
		outputs/programs/stitch_giggle_4 \
		--force --frame-rate 24 \

stitch_giggle_4-demo: stitch_giggle_4-upload
		sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play stitch_giggle_4

stitch_giggle_4-upload: outputs/programs/stitch_giggle_4
	$(PYTHON) bin/upload-program outputs/programs/stitch_giggle_4





inputs/stitch_giggle_5/stitch_giggle_5.mp3: inputs/stitch_giggle_5/stitch_giggle_5.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/stitch_giggle_5: inputs/stitch_giggle_5/stitch_giggle_5.mp3
	$(PYTHON) ./bin/compile-animation inputs/stitch_giggle_5/stitch_giggle_5.json \
		inputs/stitch_giggle_5/stitch_giggle_5.mp3 \
		outputs/programs/stitch_giggle_5 \
		--force --frame-rate 24 \

stitch_giggle_5-demo: stitch_giggle_5-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play stitch_giggle_5

stitch_giggle_5-upload: outputs/programs/stitch_giggle_5
	$(PYTHON) bin/upload-program outputs/programs/stitch_giggle_5


inputs/stitch_giggle_6/stitch_giggle_6.mp3: inputs/stitch_giggle_6/stitch_giggle_6.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/stitch_giggle_6: inputs/stitch_giggle_6/stitch_giggle_6.mp3
	mkdir -p outputs/programs/stitch_giggle_6
	cp inputs/stitch_giggle_6/stitch_giggle_6.mp3 outputs/programs/stitch_giggle_6

stitch_giggle_6-demo: stitch_giggle_6-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play stitch_giggle_6

stitch_giggle_6-upload: outputs/programs/stitch_giggle_6
	$(PYTHON) bin/upload-program outputs/programs/stitch_giggle_6


inputs/stitch_ooo/stitch_ooo.mp3: inputs/stitch_ooo/stitch_ooo.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/stitch_ooo: inputs/stitch_ooo/stitch_ooo.mp3
	mkdir -p outputs/programs/stitch_ooo
	cp inputs/stitch_ooo/stitch_ooo.mp3 outputs/programs/stitch_ooo

stitch_ooo-demo: stitch_ooo-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play stitch_ooo

stitch_ooo-upload: outputs/programs/stitch_ooo
	$(PYTHON) bin/upload-program outputs/programs/stitch_ooo













inputs/stitch_ooo/stitch_ooo.mp3: inputs/stitch_ooo/stitch_ooo.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/stitch_ooo: inputs/stitch_ooo/stitch_ooo.mp3
	$(PYTHON) ./bin/compile-animation inputs/stitch_ooo/stitch_ooo.json \
		inputs/stitch_ooo/stitch_ooo.mp3 \
		outputs/programs/stitch_ooo \
		--force --frame-rate 24 \

meeta_nala_kweesta-demo: meeta_nala_kweesta-upload
		sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play meeta_nala_kweesta

meeta_nala_kweesta-upload: outputs/programs/meeta_nala_kweesta
	$(PYTHON) bin/upload-program outputs/programs/meeta_nala_kweesta


inputs/meeta_nala_kweesta/meeta_nala_kweesta.mp3: inputs/meeta_nala_kweesta/meeta_nala_kweesta.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=0.45" $@

outputs/programs/meeta_nala_kweesta: inputs/meeta_nala_kweesta/meeta_nala_kweesta.mp3
	$(PYTHON) ./bin/compile-animation inputs/meeta_nala_kweesta/meeta_nala_kweesta.json \
		inputs/meeta_nala_kweesta/meeta_nala_kweesta.mp3 \
		outputs/programs/meeta_nala_kweesta \
		--force --frame-rate 24 \

meeta_nala_kweesta-demo: meeta_nala_kweesta-upload
		sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play meeta_nala_kweesta

meeta_nala_kweesta-upload: outputs/programs/meeta_nala_kweesta
	$(PYTHON) bin/upload-program outputs/programs/meeta_nala_kweesta

inputs/echohahaha/echohahaha.mp3: inputs/echohahaha/echohahaha.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/echohahaha: inputs/echohahaha/echohahaha.mp3
	$(PYTHON) ./bin/compile-animation inputs/echohahaha/echohahaha.json \
		inputs/echohahaha/echohahaha.mp3 \
		outputs/programs/echohahaha \
		--force --frame-rate 24 \

echohahaha-demo: echohahaha-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play echohahaha

echohahaha-upload: outputs/programs/echohahaha
	$(PYTHON) bin/upload-program outputs/programs/echohahaha




inputs/growl1/growl1.mp3: inputs/growl1/growl1.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/growl1: inputs/growl1/growl1.mp3
	$(PYTHON) ./bin/compile-animation inputs/growl1/growl1.json \
		inputs/growl1/growl1.mp3 \
		outputs/programs/growl1 \
		--force --frame-rate 24 \

growl1-demo: growl1-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play growl1

growl1-upload: outputs/programs/growl1
	$(PYTHON) bin/upload-program outputs/programs/growl1


inputs/growl2/growl2.mp3: inputs/growl2/growl2.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/growl2: inputs/growl2/growl2.mp3
	$(PYTHON) ./bin/compile-animation inputs/growl2/growl2.json \
		inputs/growl2/growl2.mp3 \
		outputs/programs/growl2 \
		--force --frame-rate 24 \

growl2-demo: growl2-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play growl2

growl2-upload: outputs/programs/growl2
	$(PYTHON) bin/upload-program outputs/programs/growl2

inputs/hahahuh/hahahuh.mp3: inputs/hahahuh/hahahuh.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/hahahuh: inputs/hahahuh/hahahuh.mp3
	$(PYTHON) ./bin/compile-animation inputs/hahahuh/hahahuh.json \
		inputs/hahahuh/hahahuh.mp3 \
		outputs/programs/hahahuh \
		--force --frame-rate 24 \

hahahuh-demo: hahahuh-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play hahahuh

hahahuh-upload: outputs/programs/hahahuh
	$(PYTHON) bin/upload-program outputs/programs/hahahuh


inputs/hauu/hauu.mp3: inputs/hauu/hauu.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/hauu: inputs/hauu/hauu.mp3
	$(PYTHON) ./bin/compile-animation inputs/hauu/hauu.json \
		inputs/hauu/hauu.mp3 \
		outputs/programs/hauu \
		--force --frame-rate 24 \

hauu-demo: hauu-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play hauu

hauu-upload: outputs/programs/hauu
	$(PYTHON) bin/upload-program outputs/programs/hauu


inputs/heehah/heehah.mp3: inputs/heehah/heehah.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/heehah: inputs/heehah/heehah.mp3
	$(PYTHON) ./bin/compile-animation inputs/heehah/heehah.json \
		inputs/heehah/heehah.mp3 \
		outputs/programs/heehah \
		--force --frame-rate 24 \

heehah-demo: heehah-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play heehah

heehah-upload: outputs/programs/heehah
	$(PYTHON) bin/upload-program outputs/programs/heehah


inputs/hih_hahahah/hih_hahahah.mp3: inputs/hih_hahahah/hih_hahahah.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/hih_hahahah: inputs/hih_hahahah/hih_hahahah.mp3
	$(PYTHON) ./bin/compile-animation inputs/hih_hahahah/hih_hahahah.json \
		inputs/hih_hahahah/hih_hahahah.mp3 \
		outputs/programs/hih_hahahah \
		--force --frame-rate 24 \

hih_hahahah-demo: hih_hahahah-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play hih_hahahah

hih_hahahah-upload: outputs/programs/hih_hahahah
	$(PYTHON) bin/upload-program outputs/programs/hih_hahahah

inputs/hreh_huh_huh_weh/hreh_huh_huh_weh.mp3: inputs/hreh_huh_huh_weh/hreh_huh_huh_weh.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/hreh_huh_huh_weh: inputs/hreh_huh_huh_weh/hreh_huh_huh_weh.mp3
	$(PYTHON) ./bin/compile-animation inputs/hreh_huh_huh_weh/hreh_huh_huh_weh.json \
		inputs/hreh_huh_huh_weh/hreh_huh_huh_weh.mp3 \
		outputs/programs/hreh_huh_huh_weh \
		--force --frame-rate 24 \

hreh_huh_huh_weh-demo: hreh_huh_huh_weh-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play hreh_huh_huh_weh

hreh_huh_huh_weh-upload: outputs/programs/hreh_huh_huh_weh
	$(PYTHON) bin/upload-program outputs/programs/hreh_huh_huh_weh

inputs/huh_weh/huh_weh.mp3: inputs/huh_weh/huh_weh.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/huh_weh: inputs/huh_weh/huh_weh.mp3
	$(PYTHON) ./bin/compile-animation inputs/huh_weh/huh_weh.json \
		inputs/huh_weh/huh_weh.mp3 \
		outputs/programs/huh_weh \
		--force --frame-rate 24 \

huh_weh-demo: huh_weh-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play huh_weh

huh_weh-upload: outputs/programs/huh_weh
	$(PYTHON) bin/upload-program outputs/programs/huh_weh


inputs/ooh/ooh.mp3: inputs/ooh/ooh.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/ooh: inputs/ooh/ooh.mp3
	$(PYTHON) ./bin/compile-animation inputs/ooh/ooh.json \
		inputs/ooh/ooh.mp3 \
		outputs/programs/ooh \
		--force --frame-rate 24 \

ooh-demo: ooh-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play ooh

ooh-upload: outputs/programs/ooh
	$(PYTHON) bin/upload-program outputs/programs/ooh


inputs/wahahah/wahahah.mp3: inputs/wahahah/wahahah.wav
	ffmpeg -y -i $< -af "dynaudnorm, compand, volume=1.5" $@

outputs/programs/wahahah: inputs/wahahah/wahahah.mp3
	$(PYTHON) ./bin/compile-animation inputs/wahahah/wahahah.json \
		inputs/wahahah/wahahah.mp3 \
		outputs/programs/wahahah \
		--force --frame-rate 24 \

wahahah-demo: wahahah-upload
	sleep 1
	$(PYTHON) ./bin/dev_cmd PUPPET_01 play wahahah

wahahah-upload: outputs/programs/wahahah
	$(PYTHON) bin/upload-program outputs/programs/wahahah

MP3S := $(shell find inputs -name '*.mp3')

.PHONY: $(DEMO_TARGETS) $(UPLOAD_TARGETS) upload-all $(MP3S)
all_mp3s: $(MP3S)

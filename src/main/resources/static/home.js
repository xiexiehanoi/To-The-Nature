// app.css
import * as THREE from "three";
//import { OrbitControls } from 'three/addons/controls/OrbitControls.js';


class App {
	constructor() {
		const divContainer = document.querySelector("#three-model");
		// _divContainer 필드화
		this._divContainer = divContainer;

		// antialias: true == 렌더링 시 오브젝트 경계선이 계단 현상 없이 표현됨
		const renderer = new THREE.WebGLRenderer({ antialias: true });
		// 화면(os)에 적용된 배율을 받아옴
		renderer.setPixelRatio(window.devicePixelRatio);
		divContainer.appendChild(renderer.domElement);
		this._renderer = renderer;

		const scene = new THREE.Scene();
		// _scene 객체 필드화
		this._scene = scene;

		// 카메라, 광원, 모델 메소드 호출
		this._setupCamera();
		this._setupLight();
		this._setupModel();
		
		//this._setupControls(); // _setupControls 메소드 호출
		

		// 창 크기가 변경될 때마다 resize 해주는 기능
		window.onresize = this.resize.bind(this);
		this.resize();
		
		// Add mouse event listeners for manual control
        this._divContainer.addEventListener('mousedown', this.onMouseDown.bind(this));
        this._divContainer.addEventListener('mousemove', this.onMouseMove.bind(this));
        this._divContainer.addEventListener('mouseup', this.onMouseUp.bind(this));

		// 렌더 메소드를 requestAnimationFrame에 넘겨줌
		requestAnimationFrame(this.render.bind(this));
	}

	_setupCamera() {
		// 3차원 그래픽을 출력할 영역의 가로/세로 크기 받아옴
		const width = this._divContainer.clientWidth;
		const height = this._divContainer.clientHeight;
		console.log(width);
		console.log(height);
		// 카메라 객체 생성
		const camera = new THREE.PerspectiveCamera(75, width / height, 0.1, 100);
		camera.position.z = 2;
		this._camera = camera;
	}
	
	//_setupControls() {
    //    // OrbitControls 생성 및 초기화
    //    this._controls = new OrbitControls(this._camera, this._renderer.domElement);
    //    this._controls.enableDamping = true;
    //    this._controls.dampingFactor = 0.25;
    //    this._controls.screenSpacePanning = false;
    //    this._controls.maxPolarAngle = Math.PI / 2;
    //}

	// 광원 생성
	_setupLight() {
		const color = 0xffffff; // 광원 색상
		const intensity = 1; // 광원 세기
		// 광원 생성
		const light = new THREE.DirectionalLight(color, intensity);
		//light.position.set(-1, 2, 4); // 광원 위치
		light.position.set(0, 0, 1); // 광원 위치
		this._scene.add(light); // scene 객체의 구성 요소로 추가
	}

	_setupModel() {
		
	    // 가로 세로 깊이 값
	    const geometry = new THREE.BoxGeometry(1, 1, 1);
	    // 색상 적용
	    const material = new THREE.MeshPhongMaterial({ color: 0x44a88 });
	    // geometry와 material를 통해서 Mesh를 만듦
	    const cube = new THREE.Mesh(geometry, material);
	    
	    material.side = THREE.DoubleSide; // 양면을 보이도록 설정
	    
	    this._scene.add(cube);
	    this._cube = cube;
	    
		
	    // 모델에 마우스 오버 이벤트를 추가합니다.
	    //this._cube.addEventListener('mouseover', () => {
        //	// Change cursor to pointer when the mouse is over the cube
        //	this._divContainer.style.cursor = 'pointer';
    	//});
	
	    // 모델에서 마우스가 벗어날 때 이벤트를 추가하여 cursor를 초기 상태로 변경합니다.
	    //this._cube.addEventListener('mouseout', () => {
        //	// Change cursor to auto when the mouse is not over the cube
        //	this._divContainer.style.cursor = 'auto';
    	//});
    	
    	// Add mousemove event listener for the container
    	this._divContainer.addEventListener('mousemove', this.onMouseMove.bind(this));

    	// Set initial cursor style
    	this._divContainer.style.cursor = 'auto';
	}


	// 창 크기 변경시 호출되는 메소드
	resize() {
		const width = this._divContainer.clientWidth;
		const height = this._divContainer.clientHeight;

		// 카메라 속성값 수정
		this._camera.aspect = width / height;
		this._camera.updateProjectionMatrix();

		this._renderer.setSize(width, height);
	}

	render(time) {
		// 렌더러가 카메라 시점을 이용하여 씬을 렌더링하라
		this._renderer.render(this._scene, this._camera);
		// 업데이트 메소드 안애서 속성 값을 변경시켜 애니메이션틀 구현함
		this.update(time);
		// 렌더 메소드를 무한으로 반복하여 호출
		requestAnimationFrame(this.render.bind(this));
	}

	update(time) {
		time *= 0.001; // ms => s 단위로 표기
		// 회전값에 시간을 지정 -> 값이 계속 바뀜
		//this._cube.rotation.x = time/4;
		this._cube.rotation.y = time/4;
		
		// 추가된 부분: OrbitControls 업데이트
        //this._controls.update();
        
		//this._cube.rotation.z = time/4;
	}
	
	// Mouse control events
    onMouseDown(event) {
        this.isMouseDown = true;
        this.previousMousePosition = {
            x: event.clientX,
            y: event.clientY
        };
    }

    onMouseMove(event) {
    	const raycaster = new THREE.Raycaster();
    	const mouse = new THREE.Vector2();
	
	    // Calculate mouse position in normalized device coordinates
	    mouse.x = (event.clientX / this._divContainer.clientWidth) * 2 - 1;
	    mouse.y = -(event.clientY / this._divContainer.clientHeight) * 2 + 1;
	
    	// Update the raycaster's origin and direction
    	raycaster.setFromCamera(mouse, this._camera);
	
	    // Check if the ray intersects with the cube
	    const intersects = raycaster.intersectObject(this._cube);
	
	    // Change cursor style based on intersection
	    if (intersects.length > 0) {
        	this._divContainer.style.cursor = 'pointer';
    	} else {
	        this._divContainer.style.cursor = 'auto';
        	if (!this.isMouseDown) return;
		}
	
	
        const deltaMousePosition = {
            x: event.clientX - this.previousMousePosition.x,
            y: event.clientY - this.previousMousePosition.y
        };

        // Adjust rotation based on mouse movement
        //this._cube.rotation.y += deltaMousePosition.x * 0.01;
        this._cube.rotation.x += deltaMousePosition.y * 0.01;

        this.previousMousePosition = {
            x: event.clientX,
            y: event.clientY
        };
    }

    onMouseUp() {
        this.isMouseDown = false;
    }
}

window.onload = function () {
	new App();
};
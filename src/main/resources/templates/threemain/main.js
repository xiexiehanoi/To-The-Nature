import * as THREE from 'three';
//import { OrbitControls } from 'three/addons/controls/OrbitControls.js';

const scene = new THREE.Scene();
const camera = new THREE.PerspectiveCamera(70, window.innerWidth / window.innerHeight, 0.1, 100);
//visible_height = 2 * Math.tan( ( Math.PI / 180 ) * camera.fov / 2 ) * distance_from_camera;

const renderer = new THREE.WebGLRenderer();

// Create renderer before camera
renderer.setSize(window.innerWidth, window.innerHeight);
document.body.appendChild(renderer.domElement);

const geometry = new THREE.BoxGeometry(1, 1, 1);
const material = new THREE.MeshBasicMaterial({ color: 0x00ff00 });
const cube = new THREE.Mesh(geometry, material);
scene.add(cube);

// Set camera position before creating controls
camera.position.z = 2;
camera.lookAt(scene.position);

//const controls = new OrbitControls(camera, renderer.domElement);

const light = new THREE.AmbientLight(0xFFFF00);
light.position.set(0, 0, 1);
scene.add(light);


renderer.setClearColor(0xdddddd, 1);


//const loop = function () {
//                mesh.rotation.x += 0.1;
//                mesh.rotation.y += 0.02;
//                mesh.rotation.z += 0.02;
//                // render() 메소드를 실행해 화면에 그린다. 필수
//                renderer.render(scene, camera);
//                // 회전시킬 loop 함수를 재귀적으로 계속 호출시킴
//                requestAnimationFrame(loop);
//            };
         
//requestAnimationFrame(loop);

// Define animate function
function animate() {
    requestAnimationFrame(animate);

    // Update controls and render scene
    //controls.update();
	cube.rotation.x += 0.01;
	cube.rotation.y += 0.01;
	
    renderer.render(scene, camera);
}

animate();
import * as THREE from 'three';
import { OrbitControls } from 'three/addons/controls/OrbitControls.js';
import { GLTFLoader } from 'three/addons/loaders/GLTFLoader.js';
import WebGL from 'three/addons/capabilities/WebGL.js';

const scene = new THREE.Scene();
const camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);
const renderer = new THREE.WebGLRenderer();

// Create renderer before camera
renderer.setSize(window.innerWidth, window.innerHeight);
document.body.appendChild(renderer.domElement);

const controls = new OrbitControls(camera, renderer.domElement);
const loader = new GLTFLoader();

camera.position.z = 5;

// Define animate function
function animate() {
    requestAnimationFrame(animate);

    // Update controls and render scene
    controls.update();
    renderer.render(scene, camera);
}

// Check for WebGL availability
if (WebGL.isWebGLAvailable()) {
    animate();  // Start the animation loop
} else {
    const warning = WebGL.getWebGLErrorMessage();
    document.body.appendChild(warning);
}

// ... Rest of your code
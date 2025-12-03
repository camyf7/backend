import { initializeApp } from "firebase/app";
import { 
  getAuth, 
  GoogleAuthProvider, 
  signInWithPopup, 
  signOut 
} from "firebase/auth";
import axios from "axios";

const firebaseConfig = {
  apiKey: "AIzaSyD488EVLQXcIlqtnnJBmZ54SOGn-1X2GVs",
  authDomain: "echomusic-1-8735e.firebaseapp.com",
  projectId: "echomusic-1-8735e",
  storageBucket: "echomusic-1-8735e.appspot.com",
  messagingSenderId: "58607629067",
  appId: "1:58607629067:web:6386b26e393eeba262a80e",
  measurementId: "G-0XR1P2QEK3"
};


// Inicializa o app Firebase
const app = initializeApp(firebaseConfig);

// Autenticação
const auth = getAuth(app);
const googleProvider = new GoogleAuthProvider();


// ⭐ LOGIN COM GOOGLE + BACKEND
export async function signInWithGooglePopup() {
  try {
    // 1) Login no Firebase
    const result = await signInWithPopup(auth, googleProvider);
    const firebaseUser = result.user;

    // 2) Pega o token do Google para validar no backend
    const idToken = await firebaseUser.getIdToken();

    // 3) Envia para o backend criar/retornar o usuário
    const response = await axios.post("http://localhost:3000/auth/google", {
      token: idToken
    });

    // 4) Retorna o usuário do backend
    return response.data;

  } catch (error) {
    console.error("Erro ao fazer login com Google:", error);
    throw error;
  }
}


// Função de logout
export async function logout() {
  await signOut(auth);
}

export { auth, googleProvider };
import { useState } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from './assets/vite.svg'
import mediumLogo from './assets/medium.svg'
import './App.css'

const initialCount: number = Number(import.meta.env.VITE_INITIAL_COUNT) || 0;

function App() {
  const [count, setCount] = useState(initialCount)

  return (
    <>
      <div>
        <a href="https://vitejs.dev" target="_blank">
          <img src={viteLogo} className="logo" alt="Vite logo" />
        </a>
        <a href="https://react.dev" target="_blank">
          <img src={reactLogo} className="logo react" alt="React logo" />
        </a>
        <a href={ import.meta.env.VITE_ARTICLE_URL } target="_blank">
          <img src={mediumLogo} className="logo medium" alt="Medium logo" />
        </a>
      </div>
      <h1>Vite + React</h1>
      <h2>{ import.meta.env.VITE_APP_TITLE.replace(/_/g, " ") }</h2>
      <div className="card">
        <button onClick={() => setCount((count) => count + 1)}>
          count is {count}
        </button>
        <p>
          The initial count was set through an environment variable 'VITE_INITIAL_COUNT' to {initialCount}
        </p>
      </div>
    </>
  )
}

export default App

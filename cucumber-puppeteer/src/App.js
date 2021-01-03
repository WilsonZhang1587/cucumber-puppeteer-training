import React, { Component } from "react";

export class App extends Component {
  state = { number: 0 };
  render() {
    const { number } = this.state;
    return (
      <div>
        {number}
        <button
          onClick={() => {
            this.setState({ number: number + 1 });
          }}
        >
          + 1
        </button>
      </div>
    );
  }
}

export default App;

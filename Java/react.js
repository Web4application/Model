async function analyzeText(text) {
    const response = await fetch('http://localhost:5000/analyze', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ text })
    });

    const result = await response.json();
    console.log(result);  // Handle the result as needed
}

analyzeText("This pizza is great!");

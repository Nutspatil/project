import React, { useEffect, useState } from 'react';
import { Line } from 'react-chartjs-2';
import io from 'socket.io-client';
import axios from 'axios';

const socket = io('http://localhost:5000');

const App: React.FC = () => {
  const [data, setData] = useState<number[]>([]);

  useEffect(() => {
    // Fetch initial data from the server
    axios.get<number[]>('http://localhost:5000/data').then((response) => {
      setData(response.data);
    });

    // Listen for real-time data updates from the server
    socket.on('dataUpdate', (newData: number[]) => {
      setData(newData);
    });
  }, []);

  const chartData = {
    labels: Array.from({ length: data.length }, (_, i) => i.toString()),
    datasets: [
      {
        label: 'Real-time Data',
        data: data,
        borderColor: 'rgb(75, 192, 192)',
        backgroundColor: 'rgba(75, 192, 192, 0.2)',
      },
    ],
  };

  return (
    <div>
      <h1>Real-time Data Visualization</h1>
      <Line data={chartData} />
    </div>
  );
};

export default App;



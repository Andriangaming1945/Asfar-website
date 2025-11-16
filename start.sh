

GREEN='\033[0;32m'
NC='\033[0m'


echo -e "${GREEN}>>> Menjalankan Laravel di port 8000...${NC}"
cd backend
php artisan serve --host=0.0.0.0 --port=8000 &
cd ..

sleep 3


echo -e "${GREEN}>>> Menjalankan Vite di port 5173...${NC}"
cd frontend
npm run dev &
cd ..

sleep 3


echo -e "${GREEN}>>> Menjalankan Cloudflare Tunnel ke Laravel (http://localhost:8000)...${NC}"
cloudflared tunnel --url http://localhost:8000

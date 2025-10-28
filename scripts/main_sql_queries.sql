-- Main SQL Queries
SELECT COUNT(*) AS total_companies FROM constituents;
SELECT [GICS Sector], COUNT(*) AS count FROM constituents GROUP BY [GICS Sector];
SELECT [GICS Sub-Industry], COUNT(*) AS count FROM constituents GROUP BY [GICS Sub-Industry] ORDER BY count DESC LIMIT 10;

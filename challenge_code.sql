/* 1) Retrieve all stations in the "East" region? */

SELECT * FROM stations
WHERE Location = 'East';

/* 2)List all shows hosted by "Vrajesh Hirjee" ? */

SELECT S.ShowName, H.HostName
FROM shows S
JOIN hosts H USING (HostID)
WHERE HostName = "Vrajesh Hirjee";

/* 3) Count the number of awards each show has won? */

SELECT 
S.showname, COUNT(A.awardname) AS No_of_Awards
FROM shows S
JOIN Awards A USING (ShowID)
GROUP BY showname;

/* 4) Find shows that have partnerships with "Spotify"? */

SELECT S.showname, P.partnername
FROM showpartnerships SP
JOIN shows S USING (showid)
JOIN partnerships P USING (partnershipid)
WHERE P.partnername = 'Spotify';

/* 5) Retrieve hosts who joined before 2010? */

SELECT hostname, YEAR(JoinDate) AS Joining_Year
FROM hosts
WHERE YEAR(JoinDate) < 2010;

/* 6) List the shows and their launch dates in descending order of launch date? */

SELECT showname, launchdate
FROM shows
ORDER BY LaunchDate DESC;

/* 7) Find the total count of shows for each host? */

SELECT HostName, ShowCount
FROM hosts H;
/* 8) Show the online presence platforms with their links? */

SELECT PlatformName, Link
FROM onlinepresence;

/* 9) Retrieve the stations in the "South" region launched after 2010? */

SELECT StationName, Location, YEAR(LaunchDate) 
FROM stations
WHERE Location LIKE 'South' and YEAR(LaunchDate) > 2010;

/* 10) Rank hosts based on the number of shows they have hosted? */

SELECT HostName, ShowCount, 
       DENSE_RANK() OVER(ORDER BY ShowCount) AS DenseRank,
       Rank() OVER(ORDER BY showcount) AS Rnk,
       Row_Number() OVER(ORDER BY showcount) AS RowNumber
FROM hosts;

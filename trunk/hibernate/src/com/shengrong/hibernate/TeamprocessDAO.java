package com.shengrong.hibernate;

import java.sql.Blob;
import java.util.Date;
import java.util.List;

import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * Teamprocess entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.shengrong.hibernate.Teamprocess
 * @author MyEclipse Persistence Tools
 */
public class TeamprocessDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(TeamprocessDAO.class);
	// property constants
	public static final String LOCATION = "location";
	public static final String BRIEF = "brief";

	public void save(Teamprocess transientInstance) {
		log.debug("saving Teamprocess instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Teamprocess persistentInstance) {
		log.debug("deleting Teamprocess instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Teamprocess findById(java.lang.Integer id) {
		log.debug("getting Teamprocess instance with id: " + id);
		try {
			Teamprocess instance = (Teamprocess) getSession().get(
					"com.shengrong.hibernate.Teamprocess", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Teamprocess instance) {
		log.debug("finding Teamprocess instance by example");
		try {
			List results = getSession()
					.createCriteria("com.shengrong.hibernate.Teamprocess")
					.add(Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Teamprocess instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Teamprocess as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByLocation(Object location) {
		return findByProperty(LOCATION, location);
	}

	public List findByBrief(Object brief) {
		return findByProperty(BRIEF, brief);
	}

	public List findAll() {
		log.debug("finding all Teamprocess instances");
		try {
			String queryString = "from Teamprocess";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public List findBySql(String queryString){
		try
		{
			
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();	
		}catch(RuntimeException re){
			log.error("findbySql failed", re);
			throw re;
		}
	}

	public Teamprocess merge(Teamprocess detachedInstance) {
		log.debug("merging Teamprocess instance");
		try {
			Teamprocess result = (Teamprocess) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Teamprocess instance) {
		log.debug("attaching dirty Teamprocess instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Teamprocess instance) {
		log.debug("attaching clean Teamprocess instance");
		try {
			getSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}